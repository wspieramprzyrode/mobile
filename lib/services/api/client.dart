import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiClient {
  Dio _dio;

  ApiClient(String url) {
    final BaseOptions options = BaseOptions(baseUrl: url);
    _dio = Dio(options);
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ),
    );
  }

  Dio getApiClient() => _dio;
}
