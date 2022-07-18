import 'package:bloc_learning/bloc/posts_bloc/posts_bloc.dart';
import 'package:bloc_learning/screens/posts_detial_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Posts extends StatelessWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is Empty) {
            context.read<PostsBloc>().add(FetchPosts());
          }
          if (state is Error) {
            return const Center(
              child: Text('Error in Loading Data'),
            );
          }
          if (state is Loaded) {
            return ListView.builder(
              itemCount: state.listOfPosts.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailScreen(
                          postId: state.listOfPosts[index].id,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 17),
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 5,
                          offset: const Offset(1, 1),
                        )
                      ],
                    ),
                    child: ListTile(
                      leading: Text(state.listOfPosts[index].id.toString()),
                      title: Text(state.listOfPosts[index].title.toString()),
                      subtitle: Text(state.listOfPosts[index].body.toString()),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
