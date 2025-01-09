import 'package:assignmentapp/screens/get_started_screen.dart.dart';
import 'package:assignmentapp/screens/create_account_screen.dart';
import 'package:assignmentapp/screens/home_page.dart';
import 'package:assignmentapp/screens/onboarding_screen.dart';
import 'package:assignmentapp/screens/splash_screen.dart';
import 'package:assignmentapp/screens/update_account_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String getStarted = '/getStarted'; 
  static const String home = '/home';
  static const String createAccount = '/create_account_screen';
  static const String updateAccount = '/update_account_screen';
  

  static final routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: onboarding, page: () => const OnboardingScreen()),
    GetPage(name: getStarted, page: () => const GetStartedScreen()),
    GetPage(name: createAccount, page: () => const CreateAccountScreen()),
    GetPage(name: updateAccount, page: () => const UpdateAccountScreen()),
    GetPage(name: home, page: () => const HomePage()),
    
  ];
}
