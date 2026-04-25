import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_test_myself/feature/auth/domain/repos/auth_repo.dart';
import 'package:fruit_test_myself/feature/auth/presentation/cubits/sign_in_cubit/sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this.authRepo}) : super(SignInInitialState());
  final AuthRepo authRepo;
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(SignInLoadingState());
    final result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold(
      (failure) => emit(SignInFailureState(message: failure.message)),
      (userEntity) => emit(SignInSuccessState(userEntity: userEntity)),
    );
  }
  
  Future<void> signInWithGoogle() async {
    emit(SignInLoadingState());
    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(SignInFailureState(message: failure.message)),
      (userEntity) => emit(SignInSuccessState(userEntity: userEntity)),
      );
    }
  }
