import 'package:flutter/material.dart';
import './meal_item.dart';
import 'package:mealapp/meal_item.dart';
import './dummy__data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category -meals';

  var categoryMeals;

  // late final String categoryId;
  //late final String categoryTitle;

  //CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['id'];
    final categoryId = routeArgs[' title'];
    final catogoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: catogoryMeals[index].id,
            title: catogoryMeals[index].title,
            imageurl: catogoryMeals[index].imageUrl,
            duration: catogoryMeals[index].duration,
            affordability: catogoryMeals[index].affordability,
            complexity: catogoryMeals[index].complexity,
          );
        },
        itemCount: catogoryMeals.length,
      ),
    );
  }
}
