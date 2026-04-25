import 'package:fruit_test_myself/feature/auth/domain/entities/user_entity.dart';

abstract class SignInState {}

final class SignInInitialState extends SignInState {}

final class SignInLoadingState extends SignInState {}

final class SignInSuccessState extends SignInState {
  final UserEntity userEntity;
  SignInSuccessState({required this.userEntity});
}

final class SignInFailureState extends SignInState {
  final String message;
  SignInFailureState({required this.message});
}