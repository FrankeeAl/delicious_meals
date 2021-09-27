import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'filter_screen.dart';

import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': const CategoriesScreen(),
      'title': const Text('Categories'),
    },
    {
      'page': const FavoritesScreen(),
      'title': const Text('Favorites'),
    },
    {
      //'page':  FilterScreen(),
      //'title': const Text('Filters'),
    },
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  final items = <Widget>[
    const Icon(Icons.category, size: 30),
    const Icon(Icons.stars, size: 30),
    const Icon(Icons.restaurant, size: 30)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _pages[_selectedPageIndex]['title'] as Widget?,
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget?,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(
            color: Theme.of(context).canvasColor,
          ),
        ),
        child: SafeArea(
          child: CurvedNavigationBar(
            items: items,
            height: 60,
            index: _selectedPageIndex,
            onTap: _selectPage,
            color: Theme.of(context).colorScheme.primary,
            animationDuration: const Duration(milliseconds: 320),
            animationCurve: Curves.easeInOutCubicEmphasized,
            buttonBackgroundColor: Theme.of(context).colorScheme.secondary,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
