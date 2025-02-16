import 'dart:developer';

import 'package:get/get.dart';
import 'package:todo/api_helper/api_helper.dart';
import 'package:todo/modules/recipes/recipemodel.dart';

class Recipecontroller extends GetxController {
  List dishlist = <Dish>[].obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetchDishes();
  }

  Future<void> fetchDishes() async {
    isLoading.value = true;
    final apiHelper = ApiHelper();
    var response = await apiHelper.fetchDishes();
    if (response.isNotEmpty) {
      dishlist.assignAll(response.map((e) => Dish.fromJson(e)).toList());
      isLoading.value = false;
    }
  }
}
