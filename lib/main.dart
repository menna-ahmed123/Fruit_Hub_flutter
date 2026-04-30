import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruit_test_myself/core/helper/on_generate_route.dart';
import 'package:fruit_test_myself/core/services/custom_bloc_observer.dart';
import 'package:fruit_test_myself/core/services/get_it_service.dart';
import 'package:fruit_test_myself/core/services/shared_prefrence_singletone.dart';
import 'package:fruit_test_myself/core/utils/app_colors.dart';
import 'package:fruit_test_myself/feature/splash/presentation/views/splash_screen.dart';
import 'package:fruit_test_myself/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await Prefs.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupServiceLocator();
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        fontFamily: "Cairo",
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashScreen.routeName,
    );
  }
}
