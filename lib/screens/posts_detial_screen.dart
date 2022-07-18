import 'package:bloc_learning/bloc/posts_bloc/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostDetailScreen extends StatelessWidget {
  final int? postId;
  const PostDetailScreen({Key? key, this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is Empty) {
            context.read<PostsBloc>().add(FetchPostDetial());
          }
          if (state is PostDetailOnError) {
            return const Center(
              child: Text('No Data Found'),
            );
          }
          if (state is PostDetailLoaded) {
            return Center(
              child: ListTile(
                leading: Text(state.postDetailLoaded.id.toString()),
                title: Text(state.postDetailLoaded.userId.toString()),
                subtitle: Text(state.postDetailLoaded.body.toString()),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
