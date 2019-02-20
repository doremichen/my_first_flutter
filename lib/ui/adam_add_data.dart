///
/// Add new data
///
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_app/model/data_model.dart';

class AddNewData extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddNewDataState();
  }

}

class _AddNewDataState extends State<AddNewData> {

  final TextEditingController nameControl = TextEditingController();
  final TextEditingController descriptionControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("build is called...");
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new data"),
      ),
      body: _buildLayout(),
    );
  }

  @override
  void dispose() {
    nameControl.dispose();
    descriptionControl.dispose();
    super.dispose();
  }
  //
  //  Subroutine
  //
  Widget _buildInput(String str, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        autofocus: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(8.0),
          labelText: str,
        ),
      ),
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Builder(
        builder: (context) {
          return RaisedButton(
            color: Colors.brown,
            child: Text('Hit me to add data'),
            onPressed: () {
              FocusScope.of(context).requestFocus(FocusNode());

             // Check whether name is empty or not
              if (nameControl.text.isEmpty) {
                // show toast
                Fluttertoast.showToast(msg: "Please input the non-empty name");
                return;
              }

              var newData = MyData(name: nameControl.text, description: descriptionControl.text);
              // Return data to the previous page
              Navigator.of(context).pop(newData);

              Fluttertoast.showToast(msg: "Pass");

            },
          );
        },
      ),
    );
  }

  Widget _buildLayout() {
    return Container(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
          child: Column(
            children: <Widget>[
              _buildInput('Name', nameControl),
              _buildInput('Description', descriptionControl),
              _buildButton(),

            ],
          ),
      ),

    );
  }

}




