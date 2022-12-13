import 'package:flutter/material.dart';

import './dummy_data.dart';
import './models/meal.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/category_meal_screen.dart';
import './screens/meal_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static const typeTheme = Typography.whiteMountainView;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = _availableMeals.where((element) {
        if (_filters['gluten'] as bool && !element.isGlutenFree) {
          return false;
        }

        if (_filters['lactose'] as bool && !element.isLactoseFree) {
          return false;
        }

        if (_filters['vegan'] as bool && !element.isVegan) {
          return false;
        }

        if (_filters['vegetarian'] as bool && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: Typography.whiteMountainView.copyWith(
          bodyLarge: MyApp.typeTheme.bodyLarge?.copyWith(
            color: const Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyMedium: MyApp.typeTheme.bodyMedium?.copyWith(
            color: const Color.fromRGBO(20, 51, 51, 1),
          ),
          titleMedium: MyApp.typeTheme.titleMedium?.copyWith(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          titleSmall: MyApp.typeTheme.titleMedium?.copyWith(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      routes: {
        '/': (ctx) => const TabsScreen(),
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(
              availableMeals: _availableMeals,
            ),
        MealDetailScreen.routeName: (ctx) => const MealDetailScreen(),
        FiltersScreen.routeName: (ctx) => FiltersScreen(
              saveFilters: _setFilters,
              filters: _filters,
            ),
      },
      onUnknownRoute: ((settings) => MaterialPageRoute(
          builder: ((context) => CategoryMealScreen(
                availableMeals: _availableMeals,
              )))),
    );
  }
}
