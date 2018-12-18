import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

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
        "new_page": (context) => NewRoute(),
        "echo_page": (context) => EchoRoute("Fixed content"),
        "random_page": (context) => RandomWordsWidget(),
        "counter_page": (context) => NewRoute2(),
        "tapbox_page": (context) => ParentWidgetC(),
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
                Navigator.pushNamed(context, "new_page");
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
            RandomWordsWidget(),
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


class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final wordPair = new WordPair.random();
    return Padding(
        padding: const EdgeInsets.all(0.8),
        child: new Text(wordPair.toString()),
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
