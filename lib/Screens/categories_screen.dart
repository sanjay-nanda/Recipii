import 'package:flutter/material.dart';
import '../Widgets/category_item.dart';

import '../dummy.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: const Text('DeliMeals'),
      ), */
      body: GridView(
          padding: EdgeInsets.all(20),
          children: DUMMY_CATEGORIES
              .map((e) => CategoryItem(e.color, e.title, e.id))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          )),
    );
  }
}
