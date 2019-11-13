import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_helloworld/components/side_menu.dart';
import 'package:flutter_helloworld/utils/space_box.dart';
import 'package:intl/intl.dart';

class Clock extends StatelessWidget {
  static const String routeName = '/clock';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Clock'),
        ),
        drawer: SideMenu(),
        body: ClockPage());
  }
}

class ClockPage extends StatefulWidget {
  ClockPage({Key key}) : super(key: key);

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
    return Container(
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
        ));
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
