import 'package:flutter/material.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../screens/favorites_screen.dart';
import '../screens/filter_screen.dart';

class FloatingActionButtonMenuItem extends StatelessWidget {
  const FloatingActionButtonMenuItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final mealId = ModalRoute.of(context)!.settings.arguments as String;

    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      direction: SpeedDialDirection.down,
      elevation: 8,
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
    );
  }
}
