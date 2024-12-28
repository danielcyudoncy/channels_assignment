import 'package:assignmentapp/screens/auth_screen.dart.dart';
import 'package:assignmentapp/screens/home_page.dart';
import 'package:assignmentapp/screens/onboarding_screen.dart';
import 'package:assignmentapp/screens/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String authScreen = '/auth_screen'; 
  static const String home = '/home';
  

  static final routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: onboarding, page: () => const OnboardingScreen()),
    GetPage(name: authScreen, page: () => const AuthScreen()),
    GetPage(name: home, page: () => const HomePage()),
    
  ];
}
