import 'package:delicious_meals/data/dummy_data.dart';
import 'package:delicious_meals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget {
  static const categoryMealsRoute = '/category-meals';
  // // final String categoryId;
  // // final String categoryTitle;

  const CategoryMealScreen({
    Key? key,
    // required this.categoryId,
    // required this.categoryTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs["id"];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle as String),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imgUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
