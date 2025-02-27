import 'dart:developer';

import 'package:get/get.dart';
import 'package:todo/api_helper/api_helper.dart';

class WeatherController extends GetxController {
  var weatherData = {}.obs;
  var isLoading = false.obs;
  var weatherData1 = {}.obs;

  void fetchWeather(String city) async {
    var token = '1ed3e1be4786ec8e17c282b9dee77492';

    final dioClient = ApiHelper();
    const baseUrl = "https://api.openweathermap.org/data/2.5/";
    const endpoint = "weather";
    isLoading.value = true;
    log(city);
    // await dioClient.fetchNatureImages("nature");
    final data = await dioClient
        .getWeather(baseUrl: baseUrl, endpoint: endpoint, queryParams: {"q": city, "appid": token});
    isLoading.value = false;
    log(data.toString());
    weatherData.value = data;
    isLoading.value = false;
  }
}
