import 'package:dartz/dartz.dart';
import 'package:fruit_test_myself/core/errors/failure.dart';
import 'package:fruit_test_myself/feature/auth/domain/entities/user_entity.dart';

abstract class AuthRepo{
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(String email, String password,
  String name
  );
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(String email, String password);

  Future<Either<Failure, UserEntity>> signInWithGoogle();
}