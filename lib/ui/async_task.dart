///
/// Used to practice
///
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';


class DemoAsyncUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return _DemoAsyncUIState();
  }

}

class _DemoAsyncUIState extends State<DemoAsyncUI> {

  List widgets = [];


  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: Text("Async UI demo"),),
        body: ListView.builder(
          itemCount: widgets.length,
          itemBuilder: (_, id) {
            return _getRow(id);
          },
        ),
    );
  }

  //
  //  private subroutine section
  //
  _loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    // Update UI
    setState(() {
      widgets = json.decode(response.body);
    });
  }

  _getRow(int i) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text("Row ${widgets[i]["title"]}"),
    );
  }

}
