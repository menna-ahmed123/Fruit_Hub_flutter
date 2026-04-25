import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    developer.log('[Bloc] ${bloc.runtimeType} created', name: 'BlocObserver');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    developer.log(
      '[Bloc] ${bloc.runtimeType} ${change.currentState.runtimeType} -> ${change.nextState.runtimeType}',
      name: 'BlocObserver',
    );
    developer.log(
      '[Bloc] next state: ${change.nextState}',
      name: 'BlocObserver',
    );
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    developer.log(
      '[Bloc] ${bloc.runtimeType} error: $error',
      name: 'BlocObserver',
      error: error,
      stackTrace: stackTrace,
    );
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    developer.log('[Bloc] ${bloc.runtimeType} closed', name: 'BlocObserver');
    super.onClose(bloc);
  }
}
