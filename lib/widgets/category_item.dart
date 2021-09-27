import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String? title;
  final Color color;

  const CategoryItem({
    Key? key,
    required this.id,
    required this.title,
    required this.color,
  }) : super(key: key);

  // void selectCategory(BuildContext ctx) {
  //   Navigator.of(ctx).push(
  //     MaterialPageRoute(
  //       builder: (_) {
  //         return CategoryMealScreen(
  //           categoryId: id,
  //           categoryTitle: title,
  //         );
  //       },
  //     ),
  //   );
  // }

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushReplacementNamed(
      CategoryMealScreen.categoryMealsRoute,
      arguments: {'id': id, 'title': title},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).colorScheme.onPrimary,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title as String),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
