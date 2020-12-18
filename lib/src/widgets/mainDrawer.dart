import 'package:flutter/material.dart';
import 'package:foodify/src/screens/settingsScreen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
    String title,
    IconData icon,
    Function tapHandler,
  ) {
    return ListTile(
      onTap: tapHandler,
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 160,
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 70),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Foodify', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Settings', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(SettingsScreen.routeName);
          }),
        ],
      ),
    );
  }
}
