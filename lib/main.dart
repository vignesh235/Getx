import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/modules/audioplayer/audioplayerView.dart';
import 'package:todo/modules/photos/photoListView.dart';
import 'package:todo/modules/todo/todoview.dart';

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
        iconButtonTheme: const IconButtonThemeData(
            style: ButtonStyle(iconSize: WidgetStatePropertyAll(40))),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primaryColor: Colors.blue,
        useMaterial3: true,
      ),
      home: Audioplayerview(),
    );
  }
}
