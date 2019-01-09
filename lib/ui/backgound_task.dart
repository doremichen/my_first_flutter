///
/// Used to practice
///
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:isolate';


class DemoBackgroundTask extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DemoBackgroundTaskState();
  }

}


class _DemoBackgroundTaskState extends State<DemoBackgroundTask> {

  List widgets = [];


  @override
  void initState() {
    super.initState();
    // load data
    _loadData();
  }

  showLoadingDialog() {
    if (widgets.length == 0) return true;

    return false;
  }

  getProgressDialog() {
    return Center(child: CircularProgressIndicator(),);
  }

  getRow(int i) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text("Item: ${widgets[i]["title"]}"),
    );
  }

  getListView() {
    return ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (context, id) {
            return getRow(id);
        },
    );
  }

  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    }

    return getListView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo background task"),),
      body: getBody(),
    );
  }

  //
  //  private subroutine section
  //
  _loadData() async {

    // Open response port
    ReceivePort response = ReceivePort();
    // isolate spawn
    await Isolate.spawn(dataLoader, response.sendPort);

    // The 'echo' isolate sends its SendPort as the first message
    SendPort handlePort = await response.first;

    // Send request to isolate and receive the response
    List msg = await _sendRequest(handlePort, "https://jsonplaceholder.typicode.com/posts");

    setState(() {
      widgets = msg;
    });

  }

  // the entry point of the isolate
  static dataLoader(SendPort sendPort) async {
    // Open the response port for incoming messages
    ReceivePort port = ReceivePort();

    // Notify isolate what port listen to
    sendPort.send(port.sendPort);

    // Handle the task and reply to main thread
    await for (var msg in port) {
      String data = msg[0];
      SendPort reply = msg[1];

      String dataURL = data;
      http.Response response = await http.get(dataURL);
      // reply response data
      reply.send(json.decode(response.body));
    }

  }

  // send request to isolate
  _sendRequest(SendPort port, String msg) {
    ReceivePort responsePort = ReceivePort();
    port.send([msg, responsePort.sendPort]);
    return responsePort.first;
  }

}




