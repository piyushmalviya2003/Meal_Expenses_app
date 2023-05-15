import 'package:flutter/material.dart';
import './meal_detail_screen.dart';
import 'package:mealapp/categories_screen.dart';
import 'package:mealapp/category_meals_screen.dart';
import 'package:mealapp/meal_detail_screen.dart';
import './category.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromARGB(255, 254, 230, 1),

        // fontfamily: 'Raleway',

        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Colors.blueAccent,
              ),
              bodyText2: TextStyle(
                color: Colors.greenAccent,
              ),
              subtitle1: TextStyle(
                fontSize: 24,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      //  home: CategoriesScreen(),
      initialRoute: '/', // default is'/'
      routes: {
        '/': (ctx) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
