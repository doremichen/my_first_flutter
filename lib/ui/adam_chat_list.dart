///
/// Used to practice
///
import 'package:flutter/material.dart';

import 'adam_chat_message.dart';

class ChatListView extends StatefulWidget {

  ChatListView({this.list});

  final List<ChatMessage> list;

  @override
  State<StatefulWidget> createState() {

    return _ChatListViewState();
  }

}

class _ChatListViewState extends State<ChatListView> {

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          reverse: true,
          itemCount: widget.list.length,
          itemBuilder: (_, id) => widget.list[id],
      ),
    );
  }

}