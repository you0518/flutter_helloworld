import 'package:flutter/material.dart';
import 'package:flutter_helloworld/components/side_menu.dart';

class Mission extends StatelessWidget {
  static const String routeName = '/mission';

  @override
  Widget build(BuildContext context) {
    final _tabs = [
      Tab(text: 'week', icon: Icon(Icons.calendar_view_day)),
      Tab(text: 'month', icon: Icon(Icons.calendar_view_day)),
      Tab(text: 'year', icon: Icon(Icons.calendar_view_day))
    ];
    return DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
            appBar: AppBar(
              title: Text('Mission'),
              bottom: TabBar(tabs: _tabs),
            ),
            drawer: SideMenu(),
            body: MissionPage()));
  }
}

class MissionPage extends StatefulWidget {
  MissionPage({Key key}) : super(key: key);

  @override
  _MissionPageState createState() => _MissionPageState();
}

class _MissionPageState extends State<MissionPage> {
  TabController _tabController;
  final _missionList = [
    {'title': 'hoge', 'content': 'content'},
    {'title': 'mugo', 'content': 'content'},
    {'title': 'poka', 'content': 'content'},
    {'title': 'tere', 'content': 'content'},
  ];
  @override
  Widget build(BuildContext context) {
    var body = TabBarView(
      controller: _tabController,
      children: [
        _getMissionListView(),
        Icon(Icons.directions_transit),
        Icon(Icons.directions_bike),
      ],
    );

    return body;
  }

  ListView _getMissionListView() {
    // ListViewのアイテムを動的に生成する場合は、builderを使う
    return ListView.builder(
      itemCount: _missionList.length,
      itemBuilder: (BuildContext context, int index) {
        var mission = _missionList[index];
        return Container(
          child: ListTile(
            leading: Icon(Icons.airplay),
            title: Text(mission['title']),
            subtitle: Text(mission['content']),
            onTap: () => showDialog(
                context: context,
                child: AlertDialog(
                  title: Text(mission['title']),
                )),
          ),
        );
      },
    );
  }
}
