///
/// The home page of the basic app
///
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_app/model/data_model.dart';

import 'adam_add_data.dart';
import 'adam_data_list.dart';

class MyDataHomePage extends StatefulWidget {

  final String title;

  MyDataHomePage({Key key, this.title}): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyDataHomePageState();
  }

}

class _MyDataHomePageState extends State<MyDataHomePage> {

  List<MyData> dataList = [
     MyData(
       name: "One",
       description: "This is One"
     ),
     MyData(
         name: "Two",
         description: "This is Two"
     ),
     MyData(
         name: "Three",
         description: "This is Three"
     ),
     MyData(
         name: "Three",
         description: "This is Three"
     ),
     MyData(
         name: "Three",
         description: "This is Three"
     ),
     MyData(
         name: "Three",
         description: "This is Three"
     ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _showAddDataForm,
          ),
        ],
      ),
      backgroundColor: Colors.brown,
      body: Container(
        child: Center(
          child: DataList(myDatas: dataList,),
        ),
      ),
    );
  }

  //
  // Subroutines
  //
  Future _showAddDataForm() async {
    // native to the add data page
    MyData newData = await Navigator.of(context)
        .push(MaterialPageRoute(
      builder: (context) => AddNewData(),
    ));

    setState(() {
      if (newData != null) {
        dataList.add(newData);
      }
    });

  }

}

