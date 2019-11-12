import 'package:flutter/material.dart';
import 'package:flutter_helloworld/utils/space_box.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
      '2019/06/02 (Tue)',
      style: TextStyle(fontSize: 20),
    );
  }

  Text textTime(BuildContext context) {
    return Text(
      '12:34:56 ☀️',
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
