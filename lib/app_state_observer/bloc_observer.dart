import 'package:bloc_learning/constants/logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///main Observer this will notifiy about changes happend in app with the
///help of Blocs it will notifiy about ther bloc who changes the state and what changes he do
///to make it possoble we have to use this [AppBlocObserver] inside main function
class AppBlocObserver extends BlocObserver {
  final LoggerMessage _loggerMessage = LoggerMessage();
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      _loggerMessage.logInfo(msg: '${bloc.runtimeType} $change');
    }
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (kDebugMode) {
      print(event);
    }
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (kDebugMode) {
      print(bloc);
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      print(transition);
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      _loggerMessage.logError(msg: error.toString() + stackTrace.toString());
    }
    super.onError(bloc, error, stackTrace);
  }
}
