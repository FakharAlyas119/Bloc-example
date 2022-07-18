import 'package:bloc_learning/api_clients/post_api_client.dart';
import 'package:bloc_learning/app_state_observer/bloc_observer.dart';
import 'package:bloc_learning/bloc/posts_bloc/posts_bloc.dart';
import 'package:bloc_learning/bloc/user_bloc/user_bloc.dart';
import 'package:bloc_learning/dio_object.dart';
import 'package:bloc_learning/repository/repository.dart';
import 'package:bloc_learning/screens/posts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(() {
    ///inside this i have to mention myApp to listen all changes
    return runApp(
      const MyApp(),
    );
  }, blocObserver: AppBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static DioObjectProvider dioObjectProvider = DioObjectProvider();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PostsBloc(
              repository: Repository(
                postApiClient: PostApiClient(),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => UserBloc(
              repository: Repository(
                postApiClient: PostApiClient(),
              ),
            ),
          )
        ],
        child: const Posts(),
      ),
      // home: const Posts(),
    );
  }
}
