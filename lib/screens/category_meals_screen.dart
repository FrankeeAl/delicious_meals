import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const categoryMealsRoute = '/category-meals';
  final List<Meal> availableMeals;
  // // final String categoryId;
  // // final String categoryTitle;

  const CategoryMealScreen({
    Key? key,
    required this.availableMeals,
    // required this.categoryId,
    // required this.categoryTitle,
  }) : super(key: key);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String? categoryTitle;
  List<Meal>? displayedMeals;

  var _loadedInitData = false;
  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals!.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs["id"];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle as String),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals![index].id,
            title: displayedMeals![index].title,
            imgUrl: displayedMeals![index].imageUrl,
            duration: displayedMeals![index].duration,
            complexity: displayedMeals![index].complexity,
            affordability: displayedMeals![index].affordability,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals?.length,
      ),
    );
  }
}
