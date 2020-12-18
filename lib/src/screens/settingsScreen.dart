import 'package:flutter/material.dart';
import 'package:foodify/src/widgets/mainDrawer.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      drawer: MainDrawer(),
      body: Center(child: Text('Settings'),),
    );
  }
}
