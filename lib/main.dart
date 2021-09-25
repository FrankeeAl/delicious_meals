import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/categories_screen.dart';
import '../screens/category_meals_screen.dart';
import '../screens/meal_detail_screen.dart';
import '../screens/tabs_screen.dart';
import '../screens/filter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
                fontSize: 16,
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(28, 3, 3, 1),
                fontSize: 20,
              ),
              headline1: const TextStyle(
                color: Color.fromRGBO(28, 3, 3, 1),
                fontSize: 24,
              ),
            ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'RobotoCondensed-Light',
            color: Colors.white,
            //color: Color.fromRGBO(31, 40, 77, 1),
            fontSize: 26,
          ),
        ),
      ),
      // home: const CategoriesScreen(),
      initialRoute: '/', //default route
      routes: {
        '/': (ctx) => const TabsScreen(),
        CategoryMealScreen.categoryMealsRoute: (ctx) =>
            const CategoryMealScreen(),
        MealDetailScreen.mealDetailsRoute: (ctx) => const MealDetailScreen(),
        FilterScreen.filterScreenRoute: (ctx) => const FilterScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      },
    );
  }
}
