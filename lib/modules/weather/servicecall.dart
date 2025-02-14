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
  // Future getWeather(String city, String apikey) async {
  //   try {
  //     Response response = await dio.get("weather", queryParameters: {"q": city, "appid": apikey});
  //     return response.data;
  //   } catch (e) {
  //     return {};
  //   }
  // }

  Future makeApical(
    String endpoint,
    String method,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
  ) async {
    try {
      switch (method) {
        case "GET":
          Response response = await dio.get(
            endpoint,
            queryParameters: queryParameters,
          );
          return response.data;
        case "POST":
          Response response = await dio.post(
            endpoint,
            queryParameters: queryParameters,
          );
          return response.data;
        default:
          Response response = await dio.put(
            endpoint,
            queryParameters: queryParameters,
          );
          return response.data;
      }
    } catch (e) {

    }
  }
}
