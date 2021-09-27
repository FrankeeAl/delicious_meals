import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../data/dummy_data.dart';
import '../widgets/fab_menu.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({Key? key}) : super(key: key);
  static const mealDetailsRoute = '/meal-details';

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(text, style: Theme.of(context).textTheme.headline1),
    );
  }

  Widget buildContainer(Widget child, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        border: Border.all(color: Theme.of(context).colorScheme.primary),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(10),
      height: 250,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    //   final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedMeal.title,
          style: AppBarTheme.of(context).titleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    elevation: 5,
                    color: Theme.of(context).colorScheme.secondaryVariant,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5.0),
                      child: Text(selectedMeal.ingredients[index],
                          style: Theme.of(context).textTheme.headline2),
                    ),
                  ),
                  itemCount: selectedMeal.ingredients.length,
                ),
                context),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
                ListView.builder(
                    itemBuilder: (ctx, index) => Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .secondaryVariant,
                                border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: ListTile(
                                leading: CircleAvatar(
                                  child: Text(
                                    '# ${(index + 1)}',
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                  backgroundColor:
                                      Theme.of(context).colorScheme.primary,
                                ),
                                title: Text(
                                  selectedMeal.steps[index],
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                              ),
                            ),
                            const Divider(),
                          ],
                        ),
                    itemCount: selectedMeal.steps.length),
                context)
          ],
        ),
      ),
      floatingActionButton: const Padding(
        padding: EdgeInsets.only(top: 65),
        child: FloatingActionButtonMenuItem(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
    );
  }
}
