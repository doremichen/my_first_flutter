///
/// data card for basic app
///
import 'package:flutter/material.dart';

import 'package:flutter_app/model/data_model.dart';
import 'adam_data_detail.dart';

class DataCard extends StatefulWidget {

  final MyData myData;

  DataCard({Key key, this.myData}):super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DataCardState();
  }

}

class _DataCardState extends State<DataCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: InkWell(
        onTap: _showDetail,
        child: Container(
          height: 115.0,
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 50.0,
                child: _cardInfo(),
              ),
            ],
          ),
        ),
      )
    );
  }

  //
  //  Subroutine
  //
  _showDetail() {
    Navigator.of(context)
        .push(MaterialPageRoute(
        builder: (context) => DataDetail(data: widget.myData,
        )));
  }


  Widget _cardInfo() {
    return Container(
      width: 290.0,
      height: 115.0,
      child: Card(
        color: Colors.amberAccent,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(widget.myData.name, style: Theme.of(context).textTheme.display1),
              Text(widget.myData.description, style: Theme.of(context).textTheme.subhead),
              Row(
                children: <Widget>[
                  Icon(Icons.star),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}



