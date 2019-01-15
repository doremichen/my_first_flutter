///
/// Used to practice to build timer
///
import 'package:flutter/material.dart';

import 'dart:async';

class DemoTimer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return _DemoTimerState();
  }

}

class _DemoTimerState extends State<DemoTimer> {

  RaisedButton _startButton;
  RaisedButton _cancelButton;
  Text _show;

  Timer _timer;

  int _count = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Demo timer"),),
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: 200.0,
              width: double.infinity,
              color: Colors.yellow,
              child: _count == 0? _show: Text("Count: $_count"),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.end,
              children: <Widget>[
                _startButton,
                _cancelButton,
              ],
            ),
          ],
        )
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    // initial widget
    _startButton = RaisedButton(
      child: Text("Start timer"),
        onPressed: _startTimer
    );

    _cancelButton = RaisedButton(
      child: Text("Cancel timer"),
      onPressed: _cancelTimer,
    );

    _show = Text("Welcome to timer demo");

  }

  //
  // private sub-routine section
  //
  _timerCB(timer) {

    _count++;

    // Update UI
    setState(() {

    });

  }


  _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), _timerCB);
  }

  _cancelTimer() {
    _timer?.cancel();
  }

}




