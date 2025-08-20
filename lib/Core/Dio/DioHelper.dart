import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  // initialize dio
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://127.0.0.1:8000/api",
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
  }

  // POST request
  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    return await dio.post(url, data: data);
  }

  // GET request
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    return await dio.get(url, queryParameters: query);
  }
}
