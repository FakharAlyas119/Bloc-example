import 'package:bloc_learning/bloc/user_bloc/user_event.dart';
import 'package:bloc_learning/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserEmpty extends UserState {}

class UserLoading extends UserState {}

class UserOnError extends UserState {}

class UserLoaded extends UserState {
  final List<UsersModel> listOfUsers;

  const UserLoaded(this.listOfUsers);

  @override
  List<Object?> get props => [listOfUsers];
}
