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
        )..interceptors
            .add(LogInterceptor(requestBody: true, responseBody: true));

  Future<Map<String, dynamic>> getWeather(
      {required String baseUrl,
      required String endpoint,
      Map<String, dynamic>? queryParams}) async {
    try {
      // Set base URL dynamically
      Response response =
          await _dio.get(baseUrl + endpoint, queryParameters: queryParams);
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
      String apiKey =
          "etKXNsUjMLW60cmpv3Xmgv9JIPnzN4uNSXcYVoyvSkwBaVvgk7HEgyLW";
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
}
