import 'package:flutter/material.dart';

_onHomeTap(BuildContext context){
  Navigator.pushNamed(context,  '/');
}

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(child: 
          Text('Sidebar'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => _onHomeTap(context),
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
          ),
        ],
      ),
    );
  }
}
