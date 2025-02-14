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
        );

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
}
