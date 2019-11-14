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
  final _dailyMissionList = [
    {'title': 'hoge', 'content': 'content', 'icon': Icon(Icons.mic)},
    {'title': 'mugo', 'content': 'content', 'icon': Icon(Icons.mic)},
    {'title': 'poka', 'content': 'content', 'icon': Icon(Icons.mic)},
    {'title': 'tere', 'content': 'content', 'icon': Icon(Icons.mic)},
  ];
  final _monthlyMissionList = [
    {'title': 'hoge', 'content': 'content', 'icon': Icon(Icons.save)},
    {'title': 'mugo', 'content': 'content', 'icon': Icon(Icons.save)},
    {'title': 'poka', 'content': 'content', 'icon': Icon(Icons.save)},
    {'title': 'tere', 'content': 'content', 'icon': Icon(Icons.save)},
    {'title': 'tere', 'content': 'content', 'icon': Icon(Icons.save)},
  ];

  final _yearlyMissionList = [
    {'title': 'hoge', 'content': 'content', 'icon': Icon(Icons.scanner)},
    {'title': 'mugo', 'content': 'content', 'icon': Icon(Icons.scanner)},
    {'title': 'poka', 'content': 'content', 'icon': Icon(Icons.scanner)},
    {'title': 'tere', 'content': 'content', 'icon': Icon(Icons.scanner)},
    {'title': 'tere', 'content': 'content', 'icon': Icon(Icons.scanner)},
    {'title': 'tere', 'content': 'content', 'icon': Icon(Icons.scanner)},
  ];
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        _getMissionListView(_dailyMissionList),
        _getMissionListView(_monthlyMissionList),
        _getMissionListView(_yearlyMissionList),
      ],
    );
  }

  ListView _getMissionListView(List<Map<String, Object>> missionList) {
    // ListViewのアイテムを動的に生成する場合は、builderを使う
    return ListView.builder(
      itemCount: missionList.length,
      itemBuilder: (BuildContext context, int index) {
        var mission = missionList[index];
        return Container(
          child: ListTile(
            leading: mission['icon'],
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
