import 'package:bloc_learning/constants/end_points.dart';
import 'package:bloc_learning/constants/logger.dart';
import 'package:dio/dio.dart';

class PostApiClient {
  final Dio _dio = Dio();
  final LoggerMessage _loggerMessage = LoggerMessage();

  Future<Response> fetchPosts() async {
    String url = EndPoints.baseURL + EndPoints.posts;
    _loggerMessage.logSuccess(msg: url);
    Response response = await _dio.get(url);
    if (response.statusCode != 200) {
      throw Exception('error getting posts');
    }
    return response;
  }

  Future<Response> fetchUsers() async {
    String url = EndPoints.baseURL + EndPoints.users;
    _loggerMessage.logSuccess(msg: url);
    Response response = await _dio.get(url);
    if (response.statusCode != 200) {
      throw Exception('error getting posts');
    }
    return response;
  }

  Future<Response> fetchPostsDetail() async {
    String url = EndPoints.baseURL + EndPoints.postsDetail;
    _loggerMessage.logSuccess(msg: url);
    Response response = await _dio.get(url);
    if (response.statusCode != 200) {
      throw Exception('error getting posts');
    }
    return response;
  }
}
