import 'package:flutter/material.dart';
import '../Widgets/meal_item.dart';
import '../dummy.dart';

class CategoryMealsScreen extends StatelessWidget {
  /*  final String id;
  final String name;

  CategoryMealsScreen(this.id, this.name); */

  static const routeName = "category-meals";
  
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String name = routeArgs['name'];
    final String Id = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where(
      (element) {
        return element.categories.contains(Id);
      },
    ).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
              imageUrl: categoryMeals[index].imageUrl);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
