import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Utils {
  static void showAlertDialog(BuildContext context) {
    showDialog(context: context,
      builder: (context) => new AlertDialog(
        title: Text("Dialog title"),
        content: Text("This is content of the dialog"),
        actions: <Widget>[
          RaisedButton(
            child: Text("Ok", style: TextStyle(color: Colors.black),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),

        ],
      ),
    );
  }


  static void showDialogInfo(BuildContext context, String message) {
    showDialog(context: context,
      builder: (context) => new AlertDialog(
        title: Text("Dialog title"),
        content: Text(message),
        actions: <Widget>[
          RaisedButton(
            child: Text("Ok", style: TextStyle(color: Colors.black),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),

        ],
      ),
    );
  }

}
