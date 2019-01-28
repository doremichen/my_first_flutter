///
/// Used to practice
///
import 'package:flutter/material.dart';
import 'package:permission/permission.dart';
import 'dart:async';



class DemoPermissionRequest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DemoPermissionRequestState();
  }

}

class _DemoPermissionRequestState extends State<DemoPermissionRequest> {
  String permissionStatus = "Unknown";


  final List<PermissionName> list = [
    PermissionName.Storage,
    PermissionName.Microphone,
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo permission request"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
              // Test button
              RaisedButton(
                child: Text("Open settings"),
                elevation: 8.0,
                onPressed: () {
                    Permission.openSettings();
                },
              ),
             Container(
               alignment: Alignment.center,
               //show platform version
               child: Text("Permission Status: $permissionStatus", style: TextStyle(fontSize: 24.0),),
             ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _checkPermission(list);

  }


  @override
  void didUpdateWidget(DemoPermissionRequest oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget enter");
  } //
  // private subroutine section
  //
  Future<void> _checkPermission(List<PermissionName> permissions) async {
    print("_checkPermission enter");
    List<Permissions> lists = await Permission.getPermissionStatus(permissions);

    lists.forEach((statusList) {
        if (statusList.permissionStatus != PermissionStatus.allow) {
          print("getPermissionStatus: Not allow");
          _processRequestPermission(permissions);

        } else {
          print("getPermissionStatus: Allow");
          permissionStatus = "Allow...";
        }
    });

    // Update UI
    setState(() {
      permissionStatus;
    });
  }

  _processRequestPermission(List<PermissionName> permissions) async {
    print("_processRequestPermission  enter");
    int allowNum = 0;
    final results = await Permission.requestPermissions(permissions);
    results.forEach((permissions) {
      // Check permission status
      if (permissions.permissionStatus != PermissionStatus.allow) {
        print("_processRequestPermission: Not allow: ${permissions.permissionName}");
        permissionStatus = "Not allow";
      } else {
        print("_processRequestPermission: Allow...: ${permissions.permissionName}");
        permissionStatus = "Allow...";
        allowNum++;
      }
    });

    if (allowNum != results.length) {
      Navigator.of(context).pop();
    }
  }

}






