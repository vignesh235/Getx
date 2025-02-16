import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Recipedetalsview extends StatefulWidget {
  const Recipedetalsview({super.key});

  @override
  State<Recipedetalsview> createState() => _RecipedetalsviewState();
}

class _RecipedetalsviewState extends State<Recipedetalsview> {
  @override
  Widget build(BuildContext context) {
    final dish = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(dish[2]),
      ),
      body: Column(
        children: [
          Image.network(dish[0]),
          Text(
            dish[1],
            style: const TextStyle(
              fontSize: 18,
              letterSpacing: .1,
            ),
          )
        ],
      ),
    );
  }
}
