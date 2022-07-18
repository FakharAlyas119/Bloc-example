import 'package:bloc/bloc.dart';
import 'package:bloc_learning/models/posts_model.dart';
import 'package:bloc_learning/models/single_post_detial_model.dart';
import 'package:bloc_learning/repository/repository.dart';
import 'package:equatable/equatable.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final Repository? repository;

  PostsBloc({this.repository})
      : assert(repository != null),
        super(Empty()) {
    on<FetchPosts>(
      (event, emit) async {
        try {
          List<PostsModel> listOfPosts = await repository!.fetchPosts();
          if (listOfPosts.isNotEmpty) {
            emit(Loaded(listOfPosts));
          } else {
            emit(OnError());
          }
        } catch (e) {
          emit(OnError());
        }
      },
    );
    on<FetchPostDetial>((event, emit) async {
      try {
        PostDetialModel singlePostDetial = await repository!.fetchPostDetail();
        emit(PostDetailLoaded(singlePostDetial));
      } catch (e) {
        emit(PostDetailOnError());
      }
    });
  }
}
