import 'package:dio/dio.dart';

class DioObjectProvider {
  Dio? dio;

  Dio? getDioObj() {
    if (dio == null) {
      dio = Dio();
      return dio;
    } else {
      return dio;
    }
  }
}
