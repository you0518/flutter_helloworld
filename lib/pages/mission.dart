import 'package:flutter/material.dart';

class MissionPage extends StatefulWidget {
  MissionPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MissionPageState createState() => _MissionPageState();
}

class _MissionPageState extends State<MissionPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _tabKey = new GlobalKey<FormState>();
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          key: _tabKey,
          controller: _tabController,
          tabs: <Widget>[
            Tab(icon: Icon(Icons.directions_car)),
            Tab(icon: Icon(Icons.directions_transit)),
            Tab(icon: Icon(Icons.directions_bike))
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          IconButton(
            icon: Icon(Icons.directions_car),
            onPressed: () => Navigator.of(context).pushNamed('/login'),
          ),
          Icon(Icons.directions_transit),
          Icon(Icons.directions_bike),
        ],
      ),
    );
  }
}
