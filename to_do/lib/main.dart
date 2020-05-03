import 'package:flutter/material.dart';

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {});
  }

  void incrementCounter() {
    _counter++;
  }

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ToDoCard(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          incrementCounter();
          _incrementCounter();
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
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 2.0,
        borderOnForeground: true,
        semanticContainer: true,
        child: InkWell(
          splashColor: Colors.amberAccent,
          onTap: (){
            print('[] inwell widh=get  was tapped inshort container was tapped ');
          },

          child: Container(
            width: 300.0,
            height: 400.0,
          ),
        ),
      ),
    );
  }
}
