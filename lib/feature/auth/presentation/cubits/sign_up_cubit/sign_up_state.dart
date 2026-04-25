import 'package:fruit_test_myself/feature/auth/domain/entities/user_entity.dart';

abstract class SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpLoadingState extends SignUpState {}

class SignUpSuccessState extends SignUpState {
  final UserEntity userEntity;
  SignUpSuccessState({required this.userEntity});
}

class SignUpFailureState extends SignUpState {
  final String message;
  SignUpFailureState({required this.message});
}