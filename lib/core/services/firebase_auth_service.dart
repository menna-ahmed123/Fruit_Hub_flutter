import 'dart:developer' as developer;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_test_myself/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      developer.log(
        'FirebaseAuthException while creating user: ${e.code} - ${e.message}',
        name: 'FirebaseAuthService',
        error: e,
      );

      if (e.code == 'weak-password') {
        throw CustomException('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('An account already exists for that email.');
      } else {
        throw CustomException(
          'An error occurred while creating the user: ${e.message}',
        );
      }
    } catch (e) {
      developer.log(
        'Unexpected error while creating user',
        name: 'FirebaseAuthService',
        error: e,
      );
      throw CustomException('An error occurred while creating the user.');
    }
  }

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      developer.log(
        'FirebaseAuthException while signing in: ${e.code} - ${e.message}',
        name: 'FirebaseAuthService',
        error: e,
      );

      if (e.code == 'user-not-found') {
        throw CustomException('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw CustomException('Wrong password provided for that user.');
      } else {
        throw CustomException(
          'An error occurred while signing in: ${e.message}',
        );
      }
    } catch (e) {
      developer.log(
        'Unexpected error while signing in',
        name: 'FirebaseAuthService',
        error: e,
      );

      throw CustomException('An error occurred while signing in.');
    }
  }

  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        throw CustomException('Sign in aborted by user');
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      return userCredential.user!;
    } catch (e) {
      developer.log(
        'Error while signing in with Google',
        name: 'FirebaseAuthService',
        error: e,
      );

      throw CustomException('Error while signing in with Google');
    }
  }
}
