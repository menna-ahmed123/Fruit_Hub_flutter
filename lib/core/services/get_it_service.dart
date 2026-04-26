import 'package:fruit_test_myself/core/services/fire_store_service.dart';
import 'package:fruit_test_myself/core/services/firebase_auth_service.dart';
import 'package:fruit_test_myself/feature/auth/data/repos/auth_repo_impl.dart';
import 'package:fruit_test_myself/feature/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';


final GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());

  getIt.registerLazySingleton<FireStoreService>(() => FireStoreService());
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(getIt<FirebaseAuthService>(), fireStoreService: getIt<FireStoreService>()),
  );

}
