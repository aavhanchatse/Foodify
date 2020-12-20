import 'package:flutter/material.dart';
import 'package:foodify/src/widgets/mainDrawer.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  SettingsScreen(this.currentFilters, this.saveFilters);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String subtitle,
    var value,
    Function updateVal,
  ) {
    return SwitchListTile(
      value: value,
      onChanged: updateVal,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };

                widget.saveFilters(selectedFilters);
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Add some filters',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  'Gluten Free',
                  'Eat Only Gluten Free',
                  _glutenFree,
                  (val) {
                    setState(() {
                      _glutenFree = val;
                    });
                  },
                ),
                _buildSwitchListTile('Vegetarian', 'Eat only Veg', _vegetarian,
                    (val) {
                  setState(
                    () {
                      _vegetarian = val;
                    },
                  );
                }),
                _buildSwitchListTile('Vegan', 'Be Vegan', _vegan, (val) {
                  setState(
                    () {
                      _vegan = val;
                    },
                  );
                }),
                _buildSwitchListTile(
                    'Lactose Free', 'Lactose Intolerant?', _lactoseFree, (val) {
                  setState(
                    () {
                      _lactoseFree = val;
                    },
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
