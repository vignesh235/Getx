import 'dart:developer';

import 'package:get/get.dart';
import 'package:todo/api_helper/api_helper.dart';

class WeatherController extends GetxController {
  var weatherData = {}.obs;
  var isLoading = false.obs;

  void fetchWeather(String city, String token) async {
    final dioClient = ApiHelper();
    const baseUrl = "https://api.openweathermap.org/data/2.5/";
    const endpoint = "";
    isLoading.value = true;
    log(city);
    final data = await dioClient.getWeather(
        baseUrl: baseUrl,
        endpoint: endpoint,
        queryParams: {"q": city, "appId": token});
    if (data != null) {
      isLoading.value = false;
      log(data.toString());
      weatherData.value = data;
    }
    isLoading.value = false;
  }
}
