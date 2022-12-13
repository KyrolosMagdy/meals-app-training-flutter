import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  final List<Meal> availableMeals;

  const CategoryMealScreen({Key? key, required this.availableMeals})
      : super(key: key);

  static const routeName = '/categorie-meal';

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle = '';
  List<Meal> categroyMeals = [];
  var _loadedInitData = false;

  @override
  void initState() {
    //...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_loadedInitData == false) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'] as String;
      final categoryId = routeArgs['id'];

      categroyMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
    }

    _loadedInitData = true;
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      categroyMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: categroyMeals[index].id,
              title: categroyMeals[index].title,
              imageUrl: categroyMeals[index].imageUrl,
              duration: categroyMeals[index].duration,
              complexity: categroyMeals[index].complexity,
              affordability: categroyMeals[index].affordability,
              removeItem: _removeMeal,
            );
          },
          itemCount: categroyMeals.length,
        ));
  }
}
