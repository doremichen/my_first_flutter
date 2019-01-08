///
/// Used to practice
///
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_app/ui/material_home.dart';

class LogInView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return _LogViewSate();
  }

}

class _LogViewSate extends State<LogInView> {

  // Edit controller
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Correct password
  final String pass = "12345678";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Log in"),),
      body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: "Username",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 12.0,),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                  obscureText:true,
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: Text("Cancel"),
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      ),
                      onPressed: () {
                        // clear text in edit field
                        _usernameController.clear();
                        _passwordController.clear();

                      },
                    ),
                    RaisedButton(
                      child: Text("NEXT"),
                      elevation: 8.0,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      ),
                      onPressed: () {

                        // name check
                        if (_usernameController.text == "") {
                          Fluttertoast.showToast(msg: "Please use the nonempty user name");
                          return;
                        }

                        // password check
                        if (_passwordController.text != pass) {
                          Fluttertoast.showToast(msg: "Erro r password");
                          return;
                        }

                        // clear text in edit field
                        _usernameController.clear();
                        _passwordController.clear();

                        // Go to home page
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));

                      },
                    ),
                  ],
                ),
              ],
            ),
      ),
    );

  }

}