import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/Category.dart';
import '../widgets/MealItem.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = "/category-meal";
//   final Category category;

//   CategoryMealScreen({this.category});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Category>;
    final category = routeArgs['category'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(categoryMeals[index]);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
