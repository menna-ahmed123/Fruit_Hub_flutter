import 'dart:developer' as developer;

import 'package:dartz/dartz.dart';
import 'package:fruit_test_myself/core/errors/exceptions.dart';
import 'package:fruit_test_myself/core/errors/failure.dart';
import 'package:fruit_test_myself/core/services/firebase_auth_service.dart';
import 'package:fruit_test_myself/feature/auth/data/models/user_model.dart';
import 'package:fruit_test_myself/feature/auth/domain/entities/user_entity.dart';
import 'package:fruit_test_myself/feature/auth/domain/repos/auth_repo.dart';


class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl(this.firebaseAuthService);

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email,
        password,
      );

      return right(UserModel.fromFirebaseUser(user));

      
    } catch (e) {
      final message = e is CustomException ? e.message : 'An unexpected error occurred.';
      developer.log(
        'Error while creating user: $message',
        name: 'AuthRepoImpl',
        error: e,
      );
      return left(ServerFailure(message));
    }
  }
  
  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email,
        password,
      );

      return right(UserModel.fromFirebaseUser(user));
      
    } catch (e) {
      final message = e is CustomException ? e.message : 'An unexpected error occurred.';
      developer.log(
        'Error while signing in: $message',
        name: 'AuthRepoImpl',
        error: e,
      );
      return left(ServerFailure(message));
    }
  }
  
  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      final message = e is CustomException ? e.message : 'An unexpected error occurred.';
      developer.log(
        'Error while signing in with Google: $message',
        name: 'AuthRepoImpl',
        error: e,
      );
      return left(ServerFailure(message));
    }
  }
}
