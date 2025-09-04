import 'package:dio/dio.dart' as dioLibrary;
import 'package:get/get.dart';
import 'package:medical2/Core/TokenService/TokenService.dart';

class DioHelper {
  static late dioLibrary.Dio dio;

  // initialize dio
  static init() {
    dio = dioLibrary.Dio(
      dioLibrary.BaseOptions(
        baseUrl: "http://127.0.0.1:8000/api",
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {"Content-Type": "application/json"},
      ),
    );
  }

  // POST request
  static Future<dioLibrary.Response> postData({
    required String url,
    Map<String, dynamic>? query,
    String? contentType,
    required Map<String, dynamic> data,
  }) async {
    return await dio.post(url, data: data, queryParameters: query);
  }

  static Future<dioLibrary.Response> postFile({
    required String url,
    required dioLibrary.FormData data,
  }) async {
    return await dio.post(
      url,
      data: data,
      options: dioLibrary.Options(
        headers: {'Content-Type': 'multipart/form-data'},
      ),
    );
  }

  static Future<dioLibrary.Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    return await dio.put(url, data: data, queryParameters: query);
  }

  static Future<dioLibrary.Response> patchData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
  }) async {
    return await dio.patch(url, data: data, queryParameters: query);
  }

  // GET request
  static Future<dioLibrary.Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    print("geeeeeeeeeet data");
    final token = await Get.find<TokenService>().getToken();
    dio.options.headers["Authorization"] = "token $token";
    return await dio.get(url, queryParameters: query,
        options:dioLibrary.Options(headers: {'Content-Type': 'multipart/form-data'})
);
  }
}
