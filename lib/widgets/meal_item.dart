import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;

  final String imgUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;
  const MealItem({
    Key? key,
    required this.title,
    required this.imgUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.id,
    required this.removeItem,
  }) : super(key: key);

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Expensive';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushReplacementNamed(
      MealDetailScreen.mealDetailsRoute,
      arguments: id,
    )
        .then((result) {
      if (result != null) {
        removeItem(result);
      }
      print(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                    // bottomRight: Radius.circular(25),
                  ),
                  child: Image.network(
                    imgUrl,
                    height: 230,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 5,
                  child: Container(
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black38,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
                top: 10,
                left: 20,
                right: 10,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(children: <Widget>[
                        const Icon(Icons.schedule),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          '$duration min',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ]),
                      Row(children: <Widget>[
                        const Icon(Icons.work),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          complexityText,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ]),
                      Row(children: <Widget>[
                        const Icon(Icons.money),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          affordabilityText,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ]),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
