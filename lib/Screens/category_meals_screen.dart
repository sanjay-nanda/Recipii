import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import '../Widgets/meal_item.dart';
import '../dummy.dart';

class CategoryMealsScreen extends StatefulWidget {
  /*  final String id;
  final String name;

  CategoryMealsScreen(this.id, this.name); */

  static const routeName = "category-meals";

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['name'];
    final String Id = routeArgs['id'];
    displayedMeals = DUMMY_MEALS.where(
      (element) {
        return element.categories.contains(Id);
      },
    ).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealID) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealID);
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
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
            imageUrl: displayedMeals[index].imageUrl,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
