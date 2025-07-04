import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (kDebugMode) {
      print('onCreate -- ${bloc.runtimeType}');
    }
  }

  @override
  void onEvent(BlocBase bloc, Object? event) {
    // Only call super.onEvent if bloc is actually a Bloc (not Cubit)
    if (bloc is Bloc) {
      super.onEvent(bloc, event);
    }
    if (kDebugMode) {
      print('onEvent -- ${bloc.runtimeType}, $event');
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      print('onChange -- ${bloc.runtimeType}, $change');
    }
  }

  @override
  void onTransition(BlocBase bloc, Transition transition) {
    // Only call super.onTransition if bloc is actually a Bloc (not Cubit)
    if (bloc is Bloc) {
      super.onTransition(bloc, transition);
    }
    if (kDebugMode) {
      print('onTransition -- ${bloc.runtimeType}, $transition');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print('onError -- ${bloc.runtimeType}, $error');
    }
    super.onError(bloc, error, stackTrace);
  }
}