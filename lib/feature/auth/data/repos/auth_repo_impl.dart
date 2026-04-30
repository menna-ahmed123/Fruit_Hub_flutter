import 'dart:convert';
import 'dart:developer' as developer;

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_test_myself/constants.dart';
import 'package:fruit_test_myself/core/errors/exceptions.dart';
import 'package:fruit_test_myself/core/errors/failure.dart';
import 'package:fruit_test_myself/core/services/fire_store_service.dart';
import 'package:fruit_test_myself/core/services/firebase_auth_service.dart';
import 'package:fruit_test_myself/core/services/shared_prefrence_singletone.dart';
import 'package:fruit_test_myself/core/utils/end_pints.dart';
import 'package:fruit_test_myself/feature/auth/data/models/user_model.dart';
import 'package:fruit_test_myself/feature/auth/domain/entities/user_entity.dart';
import 'package:fruit_test_myself/feature/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final FireStoreService fireStoreService;

  AuthRepoImpl(this.firebaseAuthService, {required this.fireStoreService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
       user = await firebaseAuthService.createUserWithEmailAndPassword(
        email,
        password,
      );
      var userEntity = UserEntity(
        id: user.uid,
        name: name,
        email: email,
      );
      await addUserData(userEntity);
      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      final message = e is CustomException
          ? e.message
          : 'An unexpected error occurred.';
      developer.log(
        'Error while creating user: $message',
        name: 'AuthRepoImpl',
        error: e,
      );
      return left(ServerFailure(message));
    }
  }

  Future<void> deleteUser(User? user) async {
      if(user != null){
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email,
        password,
      );
      var userEntity = await getUserData(userId: user.uid);
      await saveUserData(user: userEntity);

      return right(userEntity);
    } catch (e) {
      final message = e is CustomException
          ? e.message
          : 'An unexpected error occurred.';
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
    User? user;
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      UserEntity userEntity = UserModel.fromFirebaseUser(user);
      var isUserExist = await fireStoreService.checkIfDataExists(
        path: EndPints.isUserExist,
        documentId: user.uid
      );
      if(!isUserExist){
        await addUserData(userEntity);
      }
      else{
        userEntity = await getUserData(userId: user.uid);
      }
      await addUserData(userEntity);

      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      final message = e is CustomException
          ? e.message
          : 'An unexpected error occurred.';
      developer.log(
        'Error while signing in with Google: $message',
        name: 'AuthRepoImpl',
        error: e,
      );
      return left(ServerFailure(message));
    }
  }

  @override
  Future<dynamic> addUserData(UserEntity user) async {
    await fireStoreService.addData(EndPints.addUserData,UserModel.fromEntity(user).toMap(),
    documentId: user.id
    );
  }
  
  @override
  Future<UserEntity> getUserData({required String userId}) async {
    var userData = await fireStoreService.getData(path: EndPints.getUserData, documentId: userId);
    return UserModel.fromJson(userData);
  }
  
  @override
  Future<dynamic> saveUserData({required UserEntity user}) async {
      
     var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
     await Prefs.setString(kUserDataKey, jsonData);

  }
}
