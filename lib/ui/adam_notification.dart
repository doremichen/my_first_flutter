///
///  Used to practice
///
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'dart:async';


class DemoNotification extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return _DemoNotificationState();
  }

}

class _DemoNotificationState extends State<DemoNotification> {

  FlutterLocalNotificationsPlugin _notification;

  final listItem = <String>[
    "Show notification with sound",
    "Show notification without sound",
    "Show notification with default sound",
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: Text("Demo nitification"),),
        body: ListView.builder(
            itemCount: listItem.length,
            itemBuilder: (context, id) {
                return Card(
                  child: ListTile(
                    title: Text("${listItem[id]}"),
                    onTap: () {
                        if (listItem[id] == "Show notification with default sound") {
                          _showNotificationWithDefaultSound();
                        } else if (listItem[id] == "Show notification without sound") {
                          __showNotificationWithoutSound();

                        } else if (listItem[id] == "Show notification with sound") {
                          _showNotificationWithCustSound();
                        }
                    },
                  ),
                );
            },
        ),
    );
  }

  @override
  void initState() {
    super.initState();

    _notification = FlutterLocalNotificationsPlugin();

    // initialize setting
    var initialiOS = IOSInitializationSettings();
    var initialAndroid = AndroidInitializationSettings("app_icon");
    var initializationSettings = InitializationSettings(initialAndroid, initialiOS);

    // initial notification
    _notification.initialize(initializationSettings, onSelectNotification: _onSelectNotification);
  }

  //
  // private subRoutine section
  //
  Future<void> _onSelectNotification(String payload) async {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Hello notification dialog"),
        content: Text("Notification sample: $payload"),
        actions: <Widget>[
          RaisedButton(
            child: Text("Close", style: TextStyle(color: Colors.red),),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  Future<void> __showNotificationWithoutSound() async {
    var AndroidNotifyChannel = AndroidNotificationDetails("notify_channel_id",
      "Channel name",
      "Here put the channel description",
      playSound: false,
      importance: Importance.Max,
      priority: Priority.High,
    );

    var IOSNotifyChannel = IOSNotificationDetails(presentSound: false);

    var notifyDetail = NotificationDetails(AndroidNotifyChannel, IOSNotifyChannel);

    // Show notification
    await _notification.show(0, "New", "Flutter notification information", notifyDetail, payload: "No_sound");
  }

  Future<void> _showNotificationWithDefaultSound() async {
    var AndroidNotifyChannel = AndroidNotificationDetails("notify_channel_id",
        "Channel name",
        "Here put the channel description",
      importance: Importance.Max,
      priority: Priority.High,
    );

    var IOSNotifyChannel = IOSNotificationDetails();

    var notifyDetail = NotificationDetails(AndroidNotifyChannel, IOSNotifyChannel);

    // Show notification
    await _notification.show(0, "New", "Flutter notification information", notifyDetail, payload: "Default_sound");

  }

  Future<void> _showNotificationWithCustSound() async {
    var androidNotifyChannel = AndroidNotificationDetails("notify_channel_id",
      "Channel name",
      "Here put the channel description",
      sound: RawResourceAndroidNotificationSound('slow_spring_board'),
      importance: Importance.Max,
      priority: Priority.High,
    );

    var IOSNotifyChannel = IOSNotificationDetails();

    var notifyDetail = NotificationDetails(androidNotifyChannel, IOSNotifyChannel);

    // Show notification
    await _notification.show(0, "New", "Flutter notification information", notifyDetail, payload: "Cust_sound");

  }

}


