import 'dart:developer';

import 'package:get/get.dart';
import 'package:todo/modules/weather/servicecall.dart';

class WeatherController extends GetxController {
  var weatherData = {}.obs;
  var isLoading = false.obs;

  void fetchWeather(String endpoint, String method, String city, String token) async {
    isLoading.value = true;
    log(city);
    final data =
        await Apicall.instance.makeApicall(endpoint, method, {"q": city, "appid": token}, {});
    if (data != null) {
      isLoading.value = false;
      log(data.toString());
      weatherData.value = data;
    }
    isLoading.value = false;
  }
}
