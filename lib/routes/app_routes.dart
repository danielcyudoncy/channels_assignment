import 'package:assignmentapp/screens/get_started.dart';
import 'package:assignmentapp/screens/home_page.dart';
import 'package:assignmentapp/screens/onboarding_screen.dart';
import 'package:assignmentapp/screens/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String getStarted = '/get_started'; 
  static const String home = '/home';
  

  static final routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: onboarding, page: () => const OnboardingScreen()),
    GetPage(name: getStarted, page: () => const GetStartedScreen()),
    GetPage(name: home, page: () => const HomePage()),
    
  ];
}
