import 'package:flutter/material.dart';

import './screens/categories_screen.dart';
import './screens/category_meal_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const typeTheme = Typography.whiteMountainView;

  // This widget is the root of your application.
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
            bodyLarge: typeTheme.bodyLarge?.copyWith(
              color: const Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyMedium: typeTheme.bodyMedium?.copyWith(
              color: const Color.fromRGBO(20, 51, 51, 1),
            ),
            titleMedium: typeTheme.titleMedium?.copyWith(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      routes: {
        '/': (ctx) => const CategoriesScreen(),
        CategoryMealScreen.routeName: (ctx) => const CategoryMealScreen()
      },
    );
  }
}