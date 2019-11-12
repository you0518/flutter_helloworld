import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_helloworld/utils/space_box.dart';
import 'package:intl/intl.dart';

class Clock extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clock',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ClockPage(title: 'Clock'),
    );
  }
}

class ClockPage extends StatefulWidget {
  ClockPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ClockPageState createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  var _now = DateTime.now();
  final DateFormat dateFormatter = new DateFormat('yyyy/MM/dd');
  final DateFormat timeFormatter = new DateFormat('HH:mm:ss');
  @override
  void initState() {
    super.initState();
    Timer.periodic(
        Duration(seconds: 1),
        (Timer t) => setState(() {
              _now = DateTime.now();
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Drawer Header',
                style: TextStyle(color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: new Container(
          padding: new EdgeInsets.all(20.0),
          child: Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                textDate(context),
                SpaceBox.height(20),
                textTime(context),
                SpaceBox.height(20),
                buttonClock(context)
              ],
            ),
          )),
    );
  }

  Text textDate(BuildContext context) {
    return Text(
      dateFormatter.format(_now),
      style: TextStyle(fontSize: 20),
    );
  }

  Text textTime(BuildContext context) {
    return Text(
      timeFormatter.format(_now),
      style: TextStyle(fontSize: 50),
    );
  }

  Center buttonClock(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text('出勤'),
            onPressed: () => null,
          ),
          SpaceBox.width(20),
          RaisedButton(
            child: Text('退勤'),
            onPressed: () => null,
          ),
        ],
      ),
    );
  }
}
