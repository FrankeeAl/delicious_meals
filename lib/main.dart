import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/categories_screen.dart';
import '../screens/category_meals_screen.dart';
import '../screens/meal_detail_screen.dart';
import '../screens/tabs_screen.dart';
import '../screens/filter_screen.dart';
import '../screens/favorites_screen.dart';
import '../data/dummy_data.dart';
import '../models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'lactose': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
        //...
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delicious Meals',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color.fromRGBO(248, 92, 112, 10),
          secondary: Color.fromRGBO(243, 121, 112, 10),
          onError: Color.fromRGBO(228, 61, 64, 10),
          secondaryVariant: Color.fromRGBO(250, 220, 217, 10),
        ),
        canvasColor: const Color.fromRGBO(238, 214, 211, 10),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(28, 3, 3, 1),
                fontSize: 18,
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(28, 3, 3, 1),
                fontSize: 20,
              ),
              headline1: const TextStyle(
                color: Color.fromRGBO(28, 3, 3, 1),
                fontSize: 24,
              ),
              headline2: const TextStyle(
                color: Color.fromRGBO(28, 3, 3, 1),
                fontSize: 16,
              ),
            ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'RobotoCondensed-Light',
            color: Colors.white,
            //color: Color.fromRGBO(31, 40, 77, 1),
            fontSize: 22,
          ),
        ),
      ),
      // home: const CategoriesScreen(),
      initialRoute: '/', //default route
      routes: {
        '/': (ctx) => const TabsScreen(),
        CategoryMealScreen.categoryMealsRoute: (ctx) => CategoryMealScreen(
              availableMeals: _availableMeals,
            ),
        MealDetailScreen.mealDetailsRoute: (ctx) => const MealDetailScreen(),
        FilterScreen.filterScreenRoute: (ctx) => FilterScreen(
              saveFilters: _setFilters,
              currentFilters: _filters,
            ),
        FavoritesScreen.favoriteScreenRoute: (ctx) => const FavoritesScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      },
    );
  }
}
