part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class Loading extends PostsState {}

class Loaded extends PostsState {
  final List<PostsModel> listOfPosts;

  const Loaded(this.listOfPosts);
  @override
  List<Object> get props => [listOfPosts];
}

class Empty extends PostsState {}

class OnError extends PostsState {}

class PostDetailLoading extends PostsState {}

class PostDetailLoaded extends PostsState {
  final PostDetialModel postDetailLoaded;

  const PostDetailLoaded(this.postDetailLoaded);
  @override
  List<Object> get props => [postDetailLoaded];
}

class PostDetailEmpty extends PostsState {}

class PostDetailOnError extends PostsState {}
