import 'dart:developer';

import 'package:dio/dio.dart';

class Apicall {
  static final Apicall instance = Apicall._single();
  Apicall._single();
  final dio = Dio(
    BaseOptions(
      baseUrl: "https://api.openweathermap.org/data/2.5/",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );
  Future getWeather(String city, String apikey) async {
    log("APIiiiiiiiiiiiiiiiiiiiiiii");
    log(city);
    try {
      Response response = await dio.get("weather", queryParameters: {"q": city, "appid": apikey});
      return response.data;
    } catch (e) {
      return {};
    }
  }
}
