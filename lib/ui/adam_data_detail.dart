///
/// Data detail page
///
import 'package:flutter/material.dart';

import 'package:flutter_app/model/data_model.dart';

class DataDetail extends StatefulWidget {

  final MyData data;

  DataDetail({Key key, this.data}): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DataDetailState();
  }

}

class _DataDetailState extends State<DataDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Hello ${widget.data.name}"),
        backgroundColor: Colors.cyan,
      ),
      body: _dataInfo(),
    );
  }

  //
  // subroutine
  //
  Widget _rateIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.star, size: 40.0, color: Colors.amber,),
      ],
    );
  }

  Widget _dataInfo() {
    return Container(
      height: 150.0,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.indigo[800],
              Colors.indigo[600],
              Colors.indigo[400],
              Colors.indigo[200],
            ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(widget.data.name, style: TextStyle(fontSize: 32.0, color: Colors.white),),
          Text(widget.data.description, style: TextStyle(fontSize: 16.0, color: Colors.white),),
          _rateIcon(),
        ],
      ),
    );
  }

}





