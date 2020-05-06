import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:to_do/globalVariables.dart' as global;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TO DO App',
      theme: ThemeData(
        primaryIconTheme: IconThemeData(color: Colors.white),
        appBarTheme: AppBarTheme(
          color: Colors.amber,
          elevation: 0.0,
        ),
        primarySwatch: Colors.amber,
        primaryTextTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.white,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'To Do'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Theme.of(context).primaryIconTheme.color,
          onPressed: () {
            print('Menu Icon Pressed');
          },
        ),
        title: Text(
          widget.title,
          style: TextStyle(
            color: Theme.of(context).primaryTextTheme.headline1.color,
          ),
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(
              Icons.lightbulb_outline,
              color: Theme.of(context).primaryIconTheme.color,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 30,
              right: 20,
              child: Card(
                elevation: 8,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(width: 300, height: 400),
              ),
            ),
            Positioned(
              top: 30,
              right: 30,
              child: Card(
                elevation: 8,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(width: 300, height: 400),
              ),
            ),
            Positioned(
              top: 30,
              right: 40,
              child: ToDoCard(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("action button pressed");
        },
        tooltip: 'new',
        child: Icon(
          Icons.add,
          color: Theme.of(context).primaryIconTheme.color,
        ),
      ),
    );
  }
}

class ToDoCard extends StatefulWidget {
  ToDoCard({Key key}) : super(key: key);
  @override
  _ToDoCardState createState() => _ToDoCardState();
}

class _ToDoCardState extends State<ToDoCard> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      borderOnForeground: true,
      semanticContainer: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        splashColor: Colors.tealAccent,
        onTap: () {
          print('[] inwell widh=get  was tapped inshort container was tapped ');
        },
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          width: 300.0,
          height: 400.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.blue.withOpacity(0.5),
          ),
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.transparent,
                  height: 50,
                  width: 300,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                      child: Container(
                        // color: Colors.red,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              width: 225,
                              height: 34,
                              // color: Colors.blue,

                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: TextField(
                                  keyboardAppearance: Brightness.dark,
                                  maxLines: 1,
                                  maxLength: 20,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    hintText: "Add Title",
                                    hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                    icon: Icon(
                                      Icons.lightbulb_outline,
                                      color: (!isChecked)
                                          ? Colors.amberAccent
                                          : null,
                                    ),
                                    counterText: '',
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 35,
                              height: 34,

                              // color: Colors.green,
                              child: IconButton(
                                iconSize: 30,
                                splashColor: Colors.amberAccent,
                                icon: (isChecked)
                                    ? Icon(Icons.check_box)
                                    : Icon(Icons.check_box_outline_blank),
                                onPressed: () {
                                  setState(() {
                                    isChecked = !isChecked;
                                  });
                                  print("The Staus of ischecked is $isChecked");
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 5.0, right: 5.0),
                  child: Container(
                    height: 342,
                    width: 290,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0),
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 5.0),
                      child: MinimisedCardList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MinimisedCardList extends StatefulWidget {
  MinimisedCardList({Key key}) : super(key: key);
  @override
  _MinimisedCardListState createState() => _MinimisedCardListState();
}

class _MinimisedCardListState extends State<MinimisedCardList> {
  @override
  Widget build(BuildContext context) {
    bool minimisedIsChecked = false;
    return ListView.separated(
      itemCount: global.minimisedListCounter,
      itemBuilder: (context, index) {
        return Container(
          height: 30,
          width: 280,
          // color: Colors.blueAccent,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(2.0),
                child: Center(
                  child: IconButton(
                      icon: (!minimisedIsChecked)
                          ? Icon(Icons.check_box_outline_blank)
                          : Icon(Icons.check_box),
                      onPressed: () {
                        minimisedIsChecked = !minimisedIsChecked;
                        setState(() {
                          
                        });
                      }),
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => new Divider(
        thickness: 2.0,
        height: 5.0,
      ),
    );
  }
}
