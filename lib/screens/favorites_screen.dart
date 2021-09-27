import 'package:flutter/material.dart';

import '../widgets/fab_menu.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  static const favoriteScreenRoute = '/favorites';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: const Text('Your Favorites'),
      // ),
      body: Center(
        child: Text('Favorites'),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 15),
        child: FloatingActionButtonMenuItem(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
    );
  }
}
