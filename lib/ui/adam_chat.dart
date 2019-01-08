///
/// Used to practice
///
import 'package:flutter/material.dart';

import 'package:flutter_app/ui/adam_chat_message.dart';
import 'package:flutter_app/ui/adam_chat_list.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChatScreenState();
  }

}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {

  final List<ChatMessage> list = [];

  // Edit controller
  final TextEditingController _etController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adam Chat"),),
      body: Column(
        children: <Widget>[
          ChatListView(list: list,),
          Divider(height: 1.0,),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          ),
        ],
      )
    );
  }


  //
  //  private section
  //
  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child:Row(
        children: <Widget>[
          Flexible(
            child:  TextField(
              controller: _etController,
              decoration: InputDecoration.collapsed(hintText: "Send a message"),
              onSubmitted: _handleSubmitted,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(icon: Icon(Icons.send),
                onPressed: () => _handleSubmitted(_etController.text),
            ),
          ),
        ],
      ),
    );
  }

  void _handleSubmitted(String text) {
    _etController.clear();

    if (text == "") return;

    ChatMessage message = ChatMessage(
      text: text,
      controller: AnimationController(
          vsync: this,
          duration: Duration(seconds: 1),
      ),
    );

    setState(() {
      list.insert(0, message);
    });

    // start animation
    message.controller.forward();

  }

}