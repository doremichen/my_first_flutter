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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildEditInput(),
              Divider(height: 5, color: Colors.red,),
              _buildStep(),
              Divider(height: 5, color: Colors.red,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _simplePopup(),
                  SizedBox(width: 5.0,),
                  _childPopup(),

                ],
              ),
            ],
          ),
        )
      )

    );
  }

  static const iTems = [
    {
      "name": "One",
      "value": 1,
    },
    {
      "name": "Two",
      "value": 2,
    },
    {
      "name": "Three",
      "value": 3,
    },
  ];

  List<PopupMenuItem<int>> menuItems = List.generate(iTems.length, (i) {
      return PopupMenuItem<int>(
        value: iTems[i]["value"],
        child: Text(iTems[i]["name"]),
      );
  });

  // Simple popup menu
  Widget _simplePopup() => PopupMenuButton<int>(
      itemBuilder: (context) {
        return menuItems.toList();
      },
    icon: Icon(Icons.list),
  );

  // Popup action icon
  Widget _childPopup() => PopupMenuButton<int>(
    itemBuilder: (context) {
      return menuItems.toList();
    },
    child: Container(
      height: 50,
      width: 200,
      decoration: ShapeDecoration(
          shape: StadiumBorder(
            side: BorderSide(color: Colors.black, width: 2),
          ),
      ),
      child: Icon(Icons.forward),
    ),
    offset: Offset(0.0, 100.0),
  );


  List<Step> steps = [
     Step(
       title: Text("Start"),
       content: Text("Initialize data..."),
     ),
     Step(
       title: Text("End"),
       content: Text("Get response..."),
     ),
  ];
  // record step index
  int _index = 0;
  Widget _buildStep() => Container(
    color: Colors.yellow,
    child: Stepper(
        steps: steps.toList(),
        currentStep: _index,
        onStepTapped: (index) {
          setState(() {
            _index = index;
          });
        },
//        onStepContinue: () {
//          Fluttertoast.showToast(msg: "Hit Continue...");
//        },
//        onStepCancel: () {
//          Fluttertoast.showToast(msg: "Hit Cancel...");
//        },
        // Customize button of the step
        controlsBuilder: (context, {onStepContinue, onStepCancel}) {
          return Container(
            child: Row(
              children: <Widget>[
                FlatButton(
                  child: Text("Go..."),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  onPressed: () {
                    Fluttertoast.showToast(msg: "Hit Go...");
                  },
                ),
                SizedBox(width: 5.0,),
                FlatButton(
                  child: Text("Stop..."),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                  onPressed: () {
                    Fluttertoast.showToast(msg: "Hit Stop...");
                  },
                ),
              ],
            ),
          );
        },

    ),
  );


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
        SizedBox(height: 5.0,),
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



