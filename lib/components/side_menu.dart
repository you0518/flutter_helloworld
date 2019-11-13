import 'package:flutter/material.dart';
import 'package:flutter_helloworld/routes/routes.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(context),
          _createDrawerItem(
              icon: Icons.contacts,
              text: 'Clock',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.clock)),
          _createDrawerItem(
              icon: Icons.event,
              text: 'Mission',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.mission)),
        ],
      ),
    );
  }

  Widget _createHeader(context) {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("楽しいFlutter",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
