import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/modules/photos/photoListView.dart';
import 'package:todo/modules/recipes/recipe_listview.dart';
import 'package:todo/modules/todo/todoview.dart';

import 'modules/googlemap/mapview.dart';
import 'modules/weather/weatherview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Mapview(),
    );
  }
}
