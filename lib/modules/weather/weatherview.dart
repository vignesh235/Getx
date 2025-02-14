import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/modules/weather/controller.dart';

class Weatherview extends StatefulWidget {
  const Weatherview({super.key});

  @override
  State<Weatherview> createState() => _WeatherviewState();
}

String? selectedCity = "Coimbatore";
List<String> cities = [
  "Mumbai",
  "Londan",
  "Bangalore",
  "Chennai",
  "Kolkata",
  "Coimbatore"
];

class _WeatherviewState extends State<Weatherview> {
  @override
  initState() {
    super.initState();
  }

  final WeatherController todoController = Get.put(WeatherController());
  var token = '1ed3e1be4786ec8e17c282b9dee77492';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather Api",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 3, 34, 88),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                border:
                    OutlineInputBorder(), // Adds a border around the dropdown
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ),
              hint: const Text("Choose a city"),
              value: selectedCity,
              isExpanded: true,
              onTap: () {},
              onChanged: (String? newValue) {
                setState(() {
                  selectedCity = newValue;
                  todoController.fetchWeather(selectedCity!, token);
                });
              },
              itemHeight: 50,
              items: cities.map((String city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Center(child: Text(city)),
                );
              }).toList(),
            ),
          ),
          Center(
            child: Obx(() {
              if (todoController.isLoading.value) {
                return const CircularProgressIndicator();
              } else {
                return (todoController.weatherData.isEmpty)
                    ? const Text("")
                    : Column(
                        children: [
                          ListTile(
                            leading: Image.network(
                                'https://openweathermap.org/img/wn/${todoController.weatherData['weather'][0]['icon']}@2x.png'),
                            title: Text(todoController.weatherData['weather'][0]
                                ['main']),
                            subtitle: Text(todoController.weatherData['weather']
                                [0]['description']),
                          ),
                        ],
                      );
              }
            }),
          )
        ],
      ),
    );
  }
}
