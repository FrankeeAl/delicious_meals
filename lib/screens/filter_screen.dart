import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../screens/favorites_screen.dart';

class FilterScreen extends StatefulWidget {
  static const filterScreenRoute = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  const FilterScreen({
    Key? key,
    required this.saveFilters,
    required this.currentFilters,
  }) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function(bool)? updateValue,
  ) {
    return SwitchListTile(
      activeColor: Theme.of(context).colorScheme.primary,
      title: Text(title, style: Theme.of(context).textTheme.bodyText1),
      subtitle: Text(description, style: Theme.of(context).textTheme.headline2),
      onChanged: updateValue,
      value: currentValue,
    );
  }

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _vegan = widget.currentFilters['vegan']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final _selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(_selectedFilters);
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile('Gluten-free',
                    'Only include gluten-free meals.', _glutenFree, (newValue) {
                  setState(
                    () {
                      _glutenFree = newValue;
                    },
                  );
                }),
                _buildSwitchListTile(
                    'Vegetarian', 'Only include veggie meals.', _vegetarian,
                    (newValue) {
                  setState(
                    () {
                      _vegetarian = newValue;
                    },
                  );
                }),
                _buildSwitchListTile(
                    'Vegan', 'Only include vegan meals.', _vegan, (newValue) {
                  setState(
                    () {
                      _vegan = newValue;
                    },
                  );
                }),
                _buildSwitchListTile(
                    'Lactose-free',
                    'Only include lactose-free meals.',
                    _lactoseFree, (newValue) {
                  setState(
                    () {
                      _lactoseFree = newValue;
                    },
                  );
                }),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 45),
        child: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          direction: SpeedDialDirection.up,
          elevation: 15,
          backgroundColor: Theme.of(context).colorScheme.secondaryVariant,
          activeBackgroundColor: Theme.of(context).colorScheme.primary,
          animationSpeed: 300,
          curve: Curves.easeInCirc,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.favorite),
              label: 'Favorites',
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(FavoritesScreen.favoriteScreenRoute);
              },
            ),
            SpeedDialChild(
                child: const Icon(Icons.filter),
                label: 'Filters',
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(FilterScreen.filterScreenRoute);
                }),
            SpeedDialChild(
                child: const Icon(Icons.restaurant),
                label: 'Meals',
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/');
                }),
            SpeedDialChild(
              child: const Icon(Icons.delete),
              label: 'Delete',
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
