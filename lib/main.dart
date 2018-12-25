import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'utils.dart';

void main() => runApp(AdamDemoApp());

class AdamDemoApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        primarySwatch: Colors.red,
      ),
      // Register main route table
      routes: {
        "new_page": (context) => ScaleAnimateRoute(),
        "echo_page": (context) => EchoRoute("Fixed content"),
        "counter_page": (context) => NewRoute2(),
        "tapbox_page": (context) => ParentWidgetC(),
        "notify_page": (context) => CustNotifyTestRoute(),
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("Go to notify page"),
              textColor: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, "notify_page");
              },
            ),
            FlatButton(
              child: Text("go to tapBox... "*4,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,),
              onPressed: () {
                Navigator.pushNamed(context, "tapbox_page");
              },
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              'He have clicked the button this many times:',
            ),
            FlatButton(
              child: Text("open new route"),
              textColor: Colors.black,
              onPressed: () {
                Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
                        return FadeTransition(
                          opacity: animation,
                          child: ParentWidgetC(),
                        );
                },
                ));
//                Navigator.pushNamed(context, "new_page");
//                Navigator.push(context, new MaterialPageRoute(builder: (context) {
//                  return new NewRoute();
//                }));
              },
            ),
            FlatButton(
              child: Text("Open echo route"),
              textColor: Colors.red,
              onPressed: () {
                Navigator.pushNamed(context, "echo_page");
              },
            ),
            FlatButton(
              child: Text("Go to counter page"),
              textColor: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, "counter_page");
              },
            ),
            RaisedButton(
              child: Text("Show alert dialog", style: TextStyle(fontSize: 24),),
              onPressed: () {
//                showAlertDialog(context);
                Utils.showAlertDialog(context);

              },
            ),
//            FlatButton(
//              child: Text("Open random route"),
//              textColor: Colors.green,
//              onPressed: () {
//                Navigator.pushNamed(context, "random_page");
//              },
//            ),
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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Notify Notify Notify"),),
      body: NotificationListener<MyNotify> (
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
                    child: Text("Send message"),
                    onPressed: () {
                      MyNotify("Hi notify...").dispatch(context);
                    },
                  );
                },
              ),
              Text(_msg),
            ],
          ),
        ),
      ),
    );
  }

}



class NotificationTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test Test Test Notifacation"),),
      body: NotificationListener(
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
      ),
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
      appBar: AppBar(
        title: Text("Demo constrainted box"),
      ),
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
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "List view test",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Demo list view"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
        new ListTile(
        leading: new Icon(Icons.map),
        title: new Text('Maps'),
          onTap: () {

          },
      ),
      new ListTile(
        leading: new Icon(Icons.photo_album),
        title: new Text('Album'),
        onTap: () {

        },
      ),
      new ListTile(
        leading: new Icon(Icons.phone),
        title: new Text('Phone'),
        onTap: () {

        },
      ),
          ],
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Test form"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
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
                  return v.trim().length == 0? "user name can not be null...": "";
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
                        if ((_formKey.currentState as FormState).validate()) {
                            print("Pass~~~~~~~~~~~");
                        }
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
    _controller.selection = TextSelection(baseOffset: 2,
        extentOffset: _controller.text.length);

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Demo switch and checkbox"),
        ),
        body: Center(
          child: Column(
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
              TextField(
                controller: _controller,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "user name or email",
                  prefixIcon: Icon(Icons.person),
                ),
                maxLength: 100,
              ),
              TextField(
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "your login password",
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              )
            ],
          ),
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
  final String tip;
  EchoRoute(this.tip);

  @override
  State<StatefulWidget> createState() {
    return _EchoPageState();
  }

}

class _EchoPageState extends State<EchoRoute> {

  void _exite() {
    setState(() {
      Navigator.of(context).pop();
      debugDumpApp();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Echo roue"),
      ),
      body: Center(
        child: Text(widget.tip),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _exite,
        child: Icon(Icons.delete),
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
      child: FlatButton(onPressed: ()=>setState(() => ++counter),
          child: Text("counter: $counter")),
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
    return TapboxCWidget(
      active: _active,
      onChanged: _handleTapboxChanged,
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
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: Colors.yellow,
          border: _hightlight? Border.all(color: Colors.blue[700], width: 10.0,)
              : null,
        ),
      ),
    );
  }

}
