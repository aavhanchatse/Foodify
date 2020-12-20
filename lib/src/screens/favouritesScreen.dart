import 'package:flutter/material.dart';
import 'package:foodify/src/model/meal.dart';
import 'package:foodify/src/widgets/mealItem.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  FavouritesScreen(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text("You don't have any favs yet"),
      );
    } else {
      return ListView.builder(
        itemCount: favouriteMeals.length,
        itemBuilder: (context, index) {
          return MealItem(
            id: favouriteMeals[index].id,
            affordability: favouriteMeals[index].affordability,
            complexity: favouriteMeals[index].complexity,
            duration: favouriteMeals[index].duration,
            imageUrl: favouriteMeals[index].imageUrl,
            title: favouriteMeals[index].title,
          );
        },
      );
    }
  }
}
