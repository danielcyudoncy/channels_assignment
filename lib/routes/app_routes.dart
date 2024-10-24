import 'package:assignmentapp/screens/home_page.dart';
import 'package:assignmentapp/screens/onboarding_screen.dart';
import 'package:assignmentapp/screens/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding'; // Corrected route name
  static const String home = '/home';

  static final routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: onboarding, page: () => const OnboardingScreen()),
    GetPage(name: home, page: () => const HomePage()),
  ];
}
