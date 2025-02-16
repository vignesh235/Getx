import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/modules/recipes/recipeController.dart';
import 'package:todo/modules/recipes/recipedetalsview.dart';

class RecipeListView extends StatefulWidget {
  const RecipeListView({super.key});

  @override
  State<RecipeListView> createState() => _RecipeListViewState();
}

final Recipecontroller recipeController = Get.put(Recipecontroller());

class _RecipeListViewState extends State<RecipeListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Recipe List"),
        ),
        body: Obx(() {
          if (recipeController.isLoading.isTrue) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
                itemCount: recipeController.dishlist.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 200,
                    child: GestureDetector(
                      onTap: () => Get.to(const Recipedetalsview(), arguments: [
                        recipeController.dishlist[index].image,
                        recipeController.dishlist[index].desc,
                        recipeController.dishlist[index].name,
                      ]),
                      child: Card(
                        elevation: 5,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 100,
                              width: double.infinity,
                              child: Image.network(recipeController.dishlist[index].image,
                                  fit: BoxFit.cover),
                            ),
                            ListTile(
                              title: Text(recipeController.dishlist[index].hotelName),
                              subtitle: Text(recipeController.dishlist[index].name),
                              trailing: Icon(Icons.circle_rounded,
                                  color: recipeController.dishlist[index].isVeg
                                      ? Colors.green
                                      : Colors.red),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }
        }));
  }
}
