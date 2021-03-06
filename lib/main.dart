import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_app/ui/material_log_in.dart';
import 'package:flutter_app/ui/async_task.dart';
import 'package:flutter_app/ui/backgound_task.dart';
import 'package:flutter_app/ui/demo_timer.dart';
import 'package:flutter_app/ui/adam_notification.dart';
import 'package:flutter_app/ui/adam_input.dart';
import 'package:flutter_app/ui/adam_basic_app.dart';
import 'dart:async';

import 'util/utils.dart';

import 'ui/adam_chat.dart';

import 'util/_const.dart';

void main() => runApp(AdamDemoApp());



class AdamDemoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.lightBlue,
      ),
      // Register main route table
      routes: {
        App_Const.RAGE_Name[0]: (context) => MyDataHomePage(title: "Adam Basic app"),
        App_Const.RAGE_Name[1]: (context) => EchoRoute("Fixed content"),
        App_Const.RAGE_Name[2]: (context) => NewRoute2(),
        App_Const.RAGE_Name[3]: (context) => ParentWidgetC(),
        App_Const.RAGE_Name[4]: (context) => CustNotifyTestRoute(),
        App_Const.RAGE_Name[5]: (context) => CustAnimationDemo(),
        App_Const.RAGE_Name[6]: (context) => ChatScreen(),
        App_Const.RAGE_Name[7]: (context) => LogInView(),
        App_Const.RAGE_Name[8]: (context) => DemoAsyncUI(),
        App_Const.RAGE_Name[9]: (context) => DemoBackgroundTask(),
        App_Const.RAGE_Name[10]: (context) => DemoTimer(),
        App_Const.RAGE_Name[11]: (context) => DemoNotification(),
        App_Const.RAGE_Name[12]: (context) => MyTextInput(),
      },
      home: MyHomePage(title: 'Flutter Demo Main activity'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, @required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Place holder
            Container(
              height: 50,
              child: Placeholder(color: Colors.red,),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: App_Const.RAGE_Name.length,
                  itemBuilder: (context, id) {
                    return Card(
                      child: ListTile(
                        title: Text(App_Const.RAGE_Name[id]),
                        onTap: () {
                          Navigator.pushNamed(context, App_Const.RAGE_Name[id]);
                        },
                      ),

                    );
                  },
              ),
            ),
            Container(
              color: Colors.red,
              height: 5.0,
            ),

            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              'He have clicked the button this many times:',
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.

    );
  }
}

///
/// Customize animation
///
class CustomizeAnimation extends StatelessWidget {
  final Animation<double> controller;
  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;

  CustomizeAnimation({Key key, this.controller}):super(key: key) {
   // animation height
   this.height = Tween<double>(begin: .0, end: 300.0).animate(CurvedAnimation(
     parent: controller,
     curve: Interval(0.0, 0.6, curve: Curves.ease,),
   ),);

   // animation color
    this.color = ColorTween(
      begin: Colors.green,
      end: Colors.orange,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.0, 0.6, curve: Curves.easeOut,),
    ),);

    // animation padding
    this.padding = Tween<EdgeInsets>(
      begin: EdgeInsets.only(left: 10.0),
      end: EdgeInsets.only(left: 250.0)
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(.0, 1.0, curve: Curves.easeIn,),
    ),);
  }

  Widget _playAnimation(BuildContext context, Widget child) {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: padding.value,
      child: Container(
        color: color.value,
        width: 10.0,
        height: height.value,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _playAnimation,
      animation: controller,
    );
  }
}

///
/// Demo customized animation
///
class CustAnimationDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CustAnimationDemoState();
  }

}

class _CustAnimationDemoState extends State<CustAnimationDemo> with TickerProviderStateMixin
{

  AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo custimized animation"),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _playAnimation();
        },
        child: Center(
          child: Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(color: Colors.black.withOpacity(0.5)),
            ),
            child: CustomizeAnimation(controller: controller,),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: const Duration(seconds: 5));

  }

  Future<void> _playAnimation() async {
    try {
        await controller.forward().orCancel;
        await controller.reverse().orCancel;
    } on TickerCanceled {
      Fluttertoast.showToast(msg: "the animation got canceled, probably because we were disposed");
    }
  }

}

///
/// Scale animate route
///
class ScaleAnimateRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScaleAnimateRouteState();
  }

}

class _ScaleAnimateRouteState extends State<ScaleAnimateRoute> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;


  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(seconds: 1),
        vsync: this);

    // Curve animation
//    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);

//    animation = Tween(begin: 0.0, end: 300.0).animate(controller)
//    ..addListener((){
//      setState(() {
//
//      });
//    });

    animation = Tween(begin: 0.0, end: 300.0).animate(controller)
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }

      setState(() {

      });
    });

    // execute forward
    controller.forward();
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo scale animate image"),
      ),
      body: Center(
        child: Image.asset("image/demo_banner.png",
          width: animation.value,
          height: animation.value,
        ),

      )
    );
  }

}


///
/// customize notification
///
class MyNotify extends Notification {
  final String msg;
  MyNotify(this.msg);
}

class CustNotifyTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CustNotifyTestRouteState();
  }
}

class _CustNotifyTestRouteState extends State<CustNotifyTestRoute> {

  String _msg = "";

  static const List<String> tabItemsLabel = [
    "Tab1",
    "Tab2",
    "Tab3",
    "Tab4",
    "Tab5",
    "Tab6",
    "Tab7",
    "Tab8",
  ];

  List<Tab> tabItems;

  @override
  void initState() {
    super.initState();

    tabItems = List.generate(tabItemsLabel.length, (i) {
      return Tab(text: tabItemsLabel[i]);
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Notify Notify Notify"),),
      body: DefaultTabController(
          length: tabItemsLabel.length,
          child: Column(
            children: <Widget>[
              // Tab bar
              _buildTabBar(),
              // Tab bar view
              _buildTabBarView(),
            ],
          ),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  // build tab bar
  Widget _buildTabBar() => Container(
    constraints: BoxConstraints.expand(height: 50),
    child: TabBar(
      isScrollable: true,
      tabs: tabItems.toList(),
      onTap: (index) {
        Fluttertoast.showToast(msg: "Hit me: ${tabItemsLabel[index]}");
      },
    ),
  );

  // build tab bar view
  // This view depend on the tabBar item
  //
  Widget _buildTabBarView() => Expanded(
    child: Container(
      child: TabBarView(
          children: [
            Container(
              child: _buildNotifyPage(),
            ),
            Container(
              child: MyDropDownButtonPage(),
            ),
            Container(
              child: TapboxA(),
            ),
            Container(
              child: PaddingTestRoute(),
            ),
            Container(
              child: FlexLayoutTestRoute(),
            ),
            Container(
              child: ListViewTest(),
            ),
            Container(
              child: FormTestRoute(),
            ),
            Container(
              child: SwitchAndCheckBoxTest(),
            ),
          ],

      ),
    ),
  );


  Widget _buildNotifyPage() => NotificationListener<MyNotify> (
        onNotification: (notify) {
          setState(() {
            _msg = "Info: " + notify.msg;
          });
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Builder(
                builder: (context) {
                  return RaisedButton(
                    color: Colors.white,
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Send message", style: TextStyle(fontSize: 20,), textAlign: TextAlign.center,),
                    onPressed: () {
                      MyNotify("Hi notify...").dispatch(context);
                    },
                    shape: BorderDirectional(
                      top: BorderSide(color: Colors.red, width: 10),
                      bottom: BorderSide(color: Colors.grey, width: 10),
                      start: BorderSide(color: Colors.green, width: 10),
                      end: BorderSide(color: Colors.yellow, width: 10),
                    ),
                  );
                },
              ),
              Divider(color: Colors.black, height: 10,),
              Text(_msg),
            ],
          ),
        ),
      );

  Widget _buildToDoPage() => Center(
    child: Container(
      child: Text("Not implement yet..."),
    ),
  );
}

// Customize drop down button page
class MyDropDownButtonPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    return _MyDropDownButtonPageState();
  }

}

class _MyDropDownButtonPageState extends State<MyDropDownButtonPage> {

  static const List<String> itemsLabel = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
  ];

  List<DropdownMenuItem<int>> items = List.generate(itemsLabel.length, (id) {
    return DropdownMenuItem(
      value: id,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.info),
          SizedBox(width: 10,),
          Text("${itemsLabel[id]}"),
        ],
      ),
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text("Drop down page implementation..."),
            Divider(height: 5,color: Colors.black,),
            _buildDropDownButton(),
          ],
        ),
      ),
    );
  }

  // build Dropdown Button
  int _value = 0;
  Widget _buildDropDownButton() => DropdownButton<int>(
    items: items.toList(),
    value: _value,
    onChanged: (value) {
      Fluttertoast.showToast(msg: "Hit me: ${itemsLabel[value]}");
      setState(() {
        _value = value;
      });
    },
    isExpanded: true,
    hint: Text("Please select item", style: TextStyle(color: Colors.black),),
  );
}


class NotificationTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotificationListener(
        onNotification: (notify){
          switch(notify.runtimeType) {
            case ScrollStartNotification:
              print("ScrollStartNotification...");
              Fluttertoast.showToast(msg: "ScrollStartNotification...");
              break;
            case ScrollUpdateNotification:
              print("ScrollUpdateNotification...");
              Fluttertoast.showToast(msg: "ScrollUpdateNotification...");
              break;
            case ScrollEndNotification:
              print("ScrollEndNotification...");
              Fluttertoast.showToast(msg: "ScrollEndNotification...");
              break;
            case OverscrollNotification:
              print("OverscrollNotification...");
              Fluttertoast.showToast(msg: "OverscrollNotification...");
              break;
          }
        },
        child: ListView.builder(
          itemBuilder: (context, id) {
            return ListTile(title: Text("Item: $id"),);
          },
          itemCount: 100,
        )
    );
  }

}


class GestureTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GestureTestRouteState();
  }

}

class GestureTestRouteState extends State<GestureTestRoute> {
  double _width = 200.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo gesture detector"),),
      body: Center(
        child: GestureDetector(
          child: Image.asset("./image/demo_banner.png", width: _width,),
          onScaleUpdate: (ScaleUpdateDetails detail) {
            setState(() {
              _width = 200*detail.scale.clamp(0.8, 10.0);
            });
          },
        ),
      ),
    );
  }

}


class EventTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EventTestRouteSate();
  }

}

class _EventTestRouteSate extends State<EventTestRoute> {

  PointerEvent _ptEvnt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo event"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
              Listener(
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.blue,
                  width: 300.0,
                  height: 150.0,
                  child: Text(_ptEvnt?.toString()??"", style: TextStyle(color: Colors.white),),
                ),
                onPointerDown: (PointerDownEvent event) => setState(()=>_ptEvnt=event),
                onPointerMove: (PointerMoveEvent event) => setState(()=>_ptEvnt=event),
                onPointerUp: (PointerUpEvent event) => setState(()=>_ptEvnt=event),
              ),
              Stack(
                children: <Widget>[
                  Listener(
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(Size(300.0, 200.0)),
                      child: DecoratedBox(decoration: BoxDecoration(color: Colors.blue)),
                    ),
                    onPointerDown: (event) => print("point0"),
                  ),
                  Listener(
                    child: ConstrainedBox(
                        constraints: BoxConstraints.tight(Size(200.0, 100.0)),
                        child: Center(child: Text("ha ha ha"),),
                    ),
                    onPointerDown: (event) => print("point1"),
                    //behavior: HitTestBehavior.opaque,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

}

class PaddingTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Padding(padding: EdgeInsets.all(50.0),
            child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Text("Hello left"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 50.0),
                      child: Text("Hello Vertical"),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                      child: Text("Hello four direction"),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: double.infinity,
                        maxHeight: 50.0
                      ),
                      child: Container(
                        height: 100.0,
                        child: DecoratedBox(decoration: BoxDecoration(color: Colors.green)),
                      ),
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Colors.blue, Colors.orange[300]]),
                        borderRadius: BorderRadius.circular(3.0),
                        boxShadow: [BoxShadow(
                          color: Colors.black54,
                          offset: Offset(12.0, 12.0),
                          blurRadius: 4.0,
                        ),],

                      ),
                      child: Padding(padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 80.0),
                             child: Text("LogIn", style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red),
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: Text("Hello rotate"),
                          ),
                        ),
                        Text("Hi HI", style: TextStyle(color: Colors.green, fontSize: 24.0),),
                      ],
                    ),
                    Container(
                      color: Colors.black,
                      child: Transform(transform: Matrix4.skewY(0.5),
                            alignment: Alignment.topLeft,
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              color: Colors.orangeAccent,
                              child: const Text("Hi special...."),
                            ),
                      ),
                    ),
                  ],
      ),
      ),
    );
  }

}



class FlexLayoutTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              child: Text("This is constrained box message"),
              color: Colors.green,
            ),
            Positioned(
              left: 18.0,
              child: Text("I am left man"),
            ),
            Positioned(
              top: 18.0,
              child: Text("I am top man"),
            ),
          ],
        ),

      ),
    );
  }

}

class ListViewTest extends StatelessWidget {

  static const List<Icon> itemsIcon = [
    Icon(Icons.map),
    Icon(Icons.photo_album),
    Icon(Icons.phone),
  ];

  static const List<Text> itemsTitle = [
    Text('Maps'),
    Text('Album'),
    Text('Phone'),
  ];

  static List<ListTile> items = List.generate(itemsIcon.length, (id) {
    return ListTile(
       leading: itemsIcon[id],
       title: itemsTitle[id],

    );
  });


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "List view test",
      home: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(20.0),
          children: items.toList(),
        ),
      ),
    );
  }

}

class FormTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FormTestRouteSate();
  }

}

class _FormTestRouteSate extends State<FormTestRoute> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: _buildForm(),
      ),
    );
  }
  
  
  Widget _buildForm() => Form(
    key: _formKey,
    autovalidate: true,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          autofocus: true,
          controller: _nameController,
          decoration: InputDecoration(
              labelText: "Name:",
              hintText: "user name or email address",
              icon: Icon(Icons.person)
          ),
          validator: (v) {
            if (v.isEmpty) {
              return "user name can not be null...";
            }
          },
        ),
        TextFormField(
          controller: _passwordController,
          decoration: InputDecoration(
              labelText: "Password:",
              hintText: "Your log password...",
              icon: Icon(Icons.lock)
          ),
          obscureText: true,
          validator: (v) {
            return v.trim().length > 5? null: "password not less than 6...";
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top:28.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                    padding: EdgeInsets.all(15.0),
                    child: Text("LogIn"),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      if ((_formKey.currentState).validate()) {
                        Fluttertoast.showToast(msg: "pass~~~~~~");
                      }
                    }),
              ),
            ],
          ),
        ),
      ],
    ),
  );

}


class FocusTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FocusTestRouteState();
  }

}

class FocusTestRouteState extends State<FocusTestRoute> {

  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode scopeNode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo edit text focus"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            focusNode: focusNode1,
            decoration: InputDecoration(
              labelText: "Text1"
            ),
          ),
          TextField(
            focusNode: focusNode2,
            decoration: InputDecoration(
              labelText: "Text2"
            ),
          ),
          // Build button
          Builder(
            builder: (ctx) {
              return Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text("Move focus"),
                    onPressed: () {
                      if (scopeNode == null) {
                        scopeNode = FocusScope.of(context);
                      }
                      scopeNode.requestFocus(focusNode2);
                    },
                  ),
                  RaisedButton(
                    child: Text("Hide focus"),
                    onPressed: () {
                        focusNode1.unfocus();
                        focusNode2.unfocus();
                    },
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }

}


class SwitchAndCheckBoxTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SwitchAndCheckBoxTestSate();
  }
}

class _SwitchAndCheckBoxTestSate extends State<SwitchAndCheckBoxTest> {

  bool _switch = true;
  bool _check = true;

  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    super.initState();

    // set default data
    _controller.text = "hello adam....";
    _controller.selection = TextSelection(baseOffset: 0,
        extentOffset: _controller.text.length);

  }

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Switch(
            value: _switch,
            onChanged: (value) {
              print(value);
              setState(() {
                _switch = value;
              });
            },
          ),
          Checkbox(
            value: _check,
            activeColor: Colors.red,
            onChanged: (value) {
              print(value);
              setState(() {
                _check = value;
              });
            },
          ),
          Container(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _controller,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Name",
                    hintText: "user name or email",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  maxLength: 100,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "your login password",
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
              ],
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.end,
            children: <Widget>[
              RaisedButton(
                child: Text("Hit me..."),
                elevation: 8.0,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                ),
                onPressed: () {

                },
              ),
            ],
          ),
        ],
      ),
    );
  }

}


class IconRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.accessible,
          color: Colors.white,
          size: 100.0,
        ),
        Icon(
          Icons.thumb_up,
          color: Colors.white,
          size: 50.0,
        ),
        Icon(
          Icons.account_circle,
          color: Colors.white,
          size: 50.0,
        ),
      ],
    );
  }

}

class ImageRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(
          "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
      width: 100.0,
      fit: BoxFit.none,
      color: Colors.redAccent,
      colorBlendMode: BlendMode.difference,
    );
  }

}


class NewRoute extends StatelessWidget {

  final Color backgroundColor;

  const NewRoute({
      Key key,
      this.backgroundColor: Colors.grey,
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("new route"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Noraml",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
              ),
              onPressed: () => {

              },
            ),
            RaisedButton(
              child: Text("Active",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
              onPressed: () => {

              },
            ),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  OutlineButton(
                    child: Text("OutLine button1",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 12
                      ),
                    ),
                    onPressed: () => {

                    },
                  ),
                  OutlineButton(
                    child: Text("OutLine button2",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 12
                      ),
                    ),
                    onPressed: () => {

                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.thumb_up),
                    onPressed: () => {

                    },
                  ),
                ],
              ),
            ),

          ],

        ),

//        child: Container(
//          color: backgroundColor,
//          child: Text("This is new style route",
//          style: TextStyle(
//            fontSize: 24,
//            color: Colors.black,
//          ),
//          ),
//        ),
      ),
    );
  }

}

class EchoRoute extends StatefulWidget {
  String tip;
  EchoRoute(this.tip);

  @override
  State<StatefulWidget> createState() {
    return _EchoPageState();
  }

}

class _EchoPageState extends State<EchoRoute> {

  List<String> navigateStr = [
    "Info1",
    "Info2",
    "Info3",
  ];


  void _exite() {
    setState(() {
      Navigator.of(context).pop();
//      debugDumpApp();
    });
  }

  // Bottom navigate bar
  int _currIdex = 0;
  Widget _buildNavigationBottom() => BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    items: [
      BottomNavigationBarItem(
        backgroundColor: Colors.red,
        icon: Icon(Icons.info, size: 30, color: Colors.green,),
        title: Text(navigateStr[0]),
        activeIcon: Icon(Icons.info, size: 60, color: Colors.yellow,),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.info, size: 30, color: Colors.green,),
        title: Text(navigateStr[1]),
        activeIcon: Icon(Icons.info, size: 60, color: Colors.yellow,),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.info, size: 30, color: Colors.green,),
        title: Text(navigateStr[2]),
        activeIcon: Icon(Icons.info, size: 60, color: Colors.yellow,),
      ),
    ],
    currentIndex: _currIdex,
    onTap: (index) {
      _currIdex = index;
      // Update UI
      setState(() {
        widget.tip = navigateStr[index];
      });
    },
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Echo roue"),
      ),
      body: Center(
        child: Text(widget.tip),
      ),
      bottomNavigationBar: _buildNavigationBottom(),
      floatingActionButton: FloatingActionButton(
        onPressed: _exite,
        child: Icon(Icons.close),
      ),
    );
  }
}


class NewRoute2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CounterWidget();
  }

}


class CounterWidget extends StatefulWidget {

  final int initValue;

  const CounterWidget({
    Key key,
    this.initValue:0,
  });

  @override
  State<StatefulWidget> createState() {
    return _CounterWidgetState();
  }
}

class _CounterWidgetState extends State<CounterWidget> {

  int counter;

  @override
  Widget build(BuildContext context) {
    print("build");

    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to counter page"),
      ),
      body: Center(
      child: Column(
          children: <Widget>[
            FlatButton(onPressed: ()=>setState(() => ++counter),
                child: Text("counter: $counter")),
            Divider(height: 5, color: Colors.black,),
            Expanded(
              child: NotificationTestRoute(),
            ),
          ],
       ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");

  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");

  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");

  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void initState() {
      super.initState();
      counter = widget.initValue;
      print("initState");
  }

}

class TapboxA extends StatefulWidget {
  const TapboxA({Key key}):super(key:key);
  @override
  State<StatefulWidget> createState() {
    return _TapboxAState();
  }

}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(_active? "Active": "Inactive",
          style: TextStyle(fontSize: 48, color: Colors.red)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: _active? Colors.lightGreen[700]: Colors.grey[600],
        ),
      ),
    );
  }

}
///
/// TapboxB example
///
class TapboxB extends StatelessWidget {

  final bool active;
  final ValueChanged<bool> onChanged; // use to tell the parent widget

  const TapboxB({Key key, this.active: false, @required this.onChanged}):super(key:key);

  /// callback method
  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
          active? "Active": "Inactive",
          style: TextStyle(fontSize: 34, color: Colors.lightGreen),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active? Colors.lightGreen[300]: Colors.blue[100],
        ),
      ),
    );
  }

}
/// parent widget
class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ParentWidget();
  }

}

class _ParentWidget extends State<ParentWidget> {
  bool _active =  false;

  void _handleTapboxChanhe(bool newValue) {

    setState(() {
      _active = newValue;
    });


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to tapboxB"),
      ),
      body: Center(
        child: TapboxB(
          active: _active,
          onChanged: _handleTapboxChanhe,
        ),
      ),
    );
  }

}
///
/// TapboxC example
class ParentWidgetC extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ParentWidgetCState();
  }
}

class _ParentWidgetCState extends State<ParentWidgetC> {

  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo tab action"),),
      body: TapboxCWidget(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }

}

///
/// TapboxC
///
class  TapboxCWidget extends StatefulWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  const TapboxCWidget({Key key, this.active: false, @required this.onChanged}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    return _TapboxCWidgetState();
  }

}

class _TapboxCWidgetState extends State<TapboxCWidget> {

  bool _hightlight = false;

  void _handleDown(TapDownDetails detail) {
    setState(() {
      _hightlight = true;
    });
  }

  void _handleUp(TapUpDetails details) {
    setState(() {
      _hightlight = false;
    });
  }

  void _handleCancel() {
    setState(() {
      _hightlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleDown,
      onTapUp: _handleUp,
      onTap: _handleTap,
      onTapCancel: _handleCancel,
      child: Container(
        child: Center(
          child: Text(
            widget.active? "Active": "Inactive",
            style: TextStyle(fontSize: 40, color: Colors.green),
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.yellow,
          border: _hightlight? Border.all(color: Colors.blue[700], width: 10.0,)
              : null,
        ),
      ),
    );
  }

}
