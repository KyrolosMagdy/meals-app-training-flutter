import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  const CategoryMealScreen({Key? key}) : super(key: key);

  static const routeName = '/categorie-meal';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    final categroyMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: categroyMeals[index].id,
                title: categroyMeals[index].title,
                imageUrl: categroyMeals[index].imageUrl,
                duration: categroyMeals[index].duration,
                complexity: categroyMeals[index].complexity,
                affordability: categroyMeals[index].affordability);
          },
          itemCount: categroyMeals.length,
        ));
  }
}
