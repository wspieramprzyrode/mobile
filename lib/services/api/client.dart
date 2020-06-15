import 'package:dio/dio.dart';

class ApiClient {
  ApiClient(String url) {
    BaseOptions options = new BaseOptions(baseUrl: url);
    _dio = new Dio(options);
  }
  Dio _dio;
  Dio getApiClient() {
     return _dio;
  }
}