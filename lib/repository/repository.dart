import 'package:bloc_learning/api_clients/post_api_client.dart';
import 'package:bloc_learning/models/posts_model.dart';
import 'package:bloc_learning/models/single_post_detial_model.dart';
import 'package:bloc_learning/models/user_model.dart';
import 'package:dio/dio.dart';

class Repository {
  PostApiClient? postApiClient;

  Repository({this.postApiClient}) : assert(postApiClient != null);

  Future<List<PostsModel>> fetchPosts() async {
    Response response = await postApiClient!.fetchPosts();
    List<PostsModel> postList =
        (response.data as List).map((e) => PostsModel.fromJson(e)).toList();
    return postList;
  }

  Future<List<UsersModel>> fetchUsers() async {
    Response response = await postApiClient!.fetchUsers();
    List<UsersModel> usersList =
        (response.data as List).map((e) => UsersModel.fromJson(e)).toList();
    return usersList;
  }

  Future<PostDetialModel> fetchPostDetail() async {
    Response response = await postApiClient!.fetchPostsDetail();
    PostDetialModel postDetialModel = PostDetialModel.fromJson(response.data);
    return postDetialModel;
  }
}
