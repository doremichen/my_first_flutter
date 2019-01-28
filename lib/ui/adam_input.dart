///
/// Just used to practice
///
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class  MyTextInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyTextInputState();
  }

}

class _MyTextInputState extends State<MyTextInput> {

  final TextEditingController _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Demo input"),),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: _buildEditInput(),
      )

    );
  }


  Widget _buildEditInput() => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        TextField(
          controller: _inputController,
          decoration: InputDecoration(
            labelText: "Input",
            hintText: "Please input the string",
            border: OutlineInputBorder(),
          ),

        ),
        SizedBox(height: 10.0,),
        ButtonBar(
          alignment: MainAxisAlignment.end,
          children: <Widget>[
            RaisedButton(
              child: Text("Ok"),
              onPressed: () {
                  if (_inputController.text.isEmpty) {
                      Fluttertoast.showToast(msg: "Please input nonempty string");
                  } else {
                    _inputController.clear();
                    Fluttertoast.showToast(msg: "Pass!!!");
                    FocusScope.of(context).requestFocus(FocusNode());
                  }
              },
            ),
          ],
        ),
      ],
    ),
  );
}



