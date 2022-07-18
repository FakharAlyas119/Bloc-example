import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_learning/bloc/user_bloc/user_event.dart';
import 'package:bloc_learning/bloc/user_bloc/user_state.dart';
import 'package:bloc_learning/models/user_model.dart';
import 'package:bloc_learning/repository/repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  Repository? repository;

  UserBloc({
    this.repository,
  })  : assert(repository != null),
        super(UserEmpty()) {
    on<FetchUsers>(
      (event, emit) async {
        try {
          List<UsersModel> lisfOfUsers = await repository!.fetchUsers();
          if (lisfOfUsers.isNotEmpty) {
            emit(UserLoaded(lisfOfUsers));
          } else {
            emit(UserOnError());
          }
        } catch (e) {
          emit(UserOnError());
          log(e.toString());
        }
      },
    );
  }
}
