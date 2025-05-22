import 'package:rent_a_car/presentation/home_screen.dart';
import 'package:rent_a_car/presentation/login_screen.dart';
import 'package:rent_a_car/presentation/splash_screen.dart';

class Routes {
  static const splashScreen = '/';
  static const loginScreen = '/login';
  static const homeScreen = '/home';
}

var routes = {
  Routes.splashScreen: (context) => const SplashScreen(),
  Routes.loginScreen: (context) => const LoginScreen(),
  Routes.homeScreen: (context) => const HomeScreen(),
};
