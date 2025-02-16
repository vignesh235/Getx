import 'dart:developer';
import 'package:dio/dio.dart';

class ApiHelper {
  static final ApiHelper _instance = ApiHelper._internal();

  factory ApiHelper() => _instance;

  final Dio _dio;

  ApiHelper._internal()
      //initializer list
      : _dio = Dio(
          BaseOptions(
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
          ),
        )..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  Future<Map<String, dynamic>> getWeather(
      {required String baseUrl,
      required String endpoint,
      Map<String, dynamic>? queryParams}) async {
    try {
      // Set base URL dynamically
      Response response = await _dio.get(baseUrl + endpoint, queryParameters: queryParams);
      return response.data;
    } on DioException catch (e) {
      log("Dio error: ${e.message}");
      return {"error": e.message};
    } catch (e) {
      log("Unexpected error: $e");
      return {"error": "Something went wrong"};
    }
  }

  Future<Response?> fetchImages(String search) async {
    try {
      String apiKey = "etKXNsUjMLW60cmpv3Xmgv9JIPnzN4uNSXcYVoyvSkwBaVvgk7HEgyLW";
      // Replace with your actual API key
      _dio.options.headers = {
        "Authorization": apiKey,
      };

      Response response = await _dio.get(
        "https://api.pexels.com/v1/search",
        queryParameters: {
          "query": search,
          "per_page": 5,
        },
      );
      return response;
    } catch (e) {
      print("API Call Error: $e");
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> fetchDishes() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      {
        "name": "Margherita Pizza",
        "image":
            "https://media.istockphoto.com/id/686957124/photo/pizza-margherita.jpg?s=612x612&w=0&k=20&c=STQALvMIjcgXPIvpXXUXItAl05QtbmEUQ_PfwSato48=",
        "rating": 4.8,
        "desc":
            "A classic Italian pizza with a thin, crispy crust topped with fresh tomato sauce, creamy mozzarella cheese, and fragrant basil leaves. To prepare, roll out pizza dough, spread tomato sauce, top with mozzarella and basil, drizzle with olive oil, and bake at 250°C for 7-10 minutes until golden and crispy.",
        "rate": 12.99,
        "hotelName": "Italiano Ristorante",
        "type": "Veg",
        "isVeg": true
      },
      {
        "name": "Spaghetti Carbonara",
        "image":
            "https://images.services.kitchenstories.io/z_bWPIhhM6qs38B0E46CRaYs81Q=/3840x0/filters:quality(85)/images.kitchenstories.io/wagtailOriginalImages/R2568-photo-final-_0.jpg",
        "rating": 4.6,
        "desc":
            "A rich and creamy pasta dish made with al dente spaghetti tossed in a luscious sauce of egg yolk, Parmesan cheese, crispy pancetta, and freshly cracked black pepper. To prepare, cook spaghetti, crisp pancetta, mix egg yolks with Parmesan, combine with hot pasta off heat, and serve with extra cheese and pepper.",
        "rate": 14.50,
        "hotelName": "Pasta Palace",
        "type": "Non-Veg",
        "isVeg": false
      },
      {
        "name": "Chicken Biryani",
        "image":
            "https://www.cubesnjuliennes.com/wp-content/uploads/2020/07/Chicken-Biryani-Recipe.jpg",
        "rating": 4.9,
        "desc":
            "An aromatic rice dish made with long-grain basmati rice, marinated chicken, caramelized onions, and warm Indian spices like saffron and cardamom. To prepare, marinate chicken, partially cook rice, sauté onions and spices, layer with rice, add saffron milk, and cook on low heat for 20-25 minutes.",
        "rate": 10.99,
        "hotelName": "Spice Haven",
        "type": "Non-Veg",
        "isVeg": false
      },
      {
        "name": "Sushi Platter",
        "image": "https://www.foodiesfeed.com/wp-content/uploads/2023/04/sushi-platter-1.jpg",
        "rating": 4.7,
        "desc":
            "A beautifully presented assortment of sushi, including nigiri, sashimi, and maki rolls, made with fresh seafood, creamy avocado, and perfectly seasoned sushi rice. To prepare, cook sushi rice, season with rice vinegar, slice fresh fish, assemble rolls with nori, and serve with soy sauce, wasabi, and pickled ginger.",
        "rate": 18.75,
        "hotelName": "Tokyo Bites",
        "type": "Non-Veg",
        "isVeg": false
      },
      {
        "name": "Cheeseburger",
        "image":
            "https://assets.epicurious.com/photos/5c745a108918ee7ab68daf79/1:1/w_1600,c_limit/Smashburger-recipe-120219.jpg",
        "rating": 4.5,
        "desc":
            "A juicy, perfectly grilled beef patty layered with melted cheddar cheese, crisp lettuce, fresh tomatoes, and tangy pickles, in a toasted brioche bun. To prepare, season and grill beef patties, melt cheese, toast buns, assemble with toppings, and serve with fries.",
        "rate": 8.99,
        "hotelName": "Burger Junction",
        "type": "Non-Veg",
        "isVeg": false
      },
      {
        "name": "Paneer Butter Masala",
        "image": "https://myfoodstory.com/wp-content/uploads/2021/07/Paneer-Butter-Masala-3.jpg",
        "rating": 4.8,
        "desc":
            "A rich and creamy North Indian curry featuring tender paneer cubes simmered in a velvety tomato-based gravy with butter and fresh cream. To prepare, blend sautéed onions and tomatoes, cook with butter and spices, add cream, mix in paneer, and serve with naan or rice.",
        "rate": 11.50,
        "hotelName": "Curry Delight",
        "type": "Veg",
        "isVeg": true
      }
    ];
  }
}
