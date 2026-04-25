import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_test_myself/feature/auth/domain/repos/auth_repo.dart';
import 'package:fruit_test_myself/feature/auth/presentation/cubits/sign_up_cubit/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.authRepo}) : super(SignUpInitialState());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(String email, String password, String name) async {
    emit(SignUpLoadingState());
    final result = await authRepo.createUserWithEmailAndPassword(email, password, name);
    result.fold(
      (failure) => emit(SignUpFailureState(message: failure.message)),
            (userEntity) => emit(SignUpSuccessState(userEntity: userEntity)),
    );
  }
  
}