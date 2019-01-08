///
/// Used to practice
///
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {

  // Build menu choice list
  final List<MenuChoice> list = [
    MenuChoice(title: "Exit", onPress: (context) {
        Fluttertoast.showToast(msg: "Hit me: Exit");
    }),
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 100.0,
            flexibleSpace: FlexibleSpaceBar(background: Image.asset("image/demo_banner.png", fit: BoxFit.cover,),),
            title: const Text("Home page", style: TextStyle(color: Colors.orange),),
            actions: <Widget>[
              PopupMenuButton<MenuChoice>(
                onSelected: (choice) {
                  choice.onPress(context);
                },
                icon: Icon(Icons.menu),
                itemBuilder: (context) {
                  return list.map((MenuChoice choice) {
                    return PopupMenuItem<MenuChoice>(
                      value: choice,
                      child: Text(choice.title),
                    );
                  }).toList();
                },
              )
            ],
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, id) {
              return GestureDetector(
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.red[100 * (id % 9)],
                    child: Text("Item $id"),
                  )
                ),
                onTap: () {
                  Fluttertoast.showToast(msg: "Hit me: $id");
                },
              );
            }, childCount: 10),

            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 3.0,
            ),

          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, id) {
                  return Card(
                    child: ListTile(
                      title: Text("item $id"),
                      onTap: () {
                        Fluttertoast.showToast(msg: "Hit item $id");
                      },
                    )
                  );
                },
                childCount: 10,
              ),
          ),
        ],
      ),
    );
  }

}

// define callback function for pressed menu item
typedef OnPressCallBack = Widget Function(BuildContext context);

//
// Menu choice
//
class MenuChoice {

  MenuChoice({this.title, this.onPress});

  final String title;
  final OnPressCallBack onPress;
}

