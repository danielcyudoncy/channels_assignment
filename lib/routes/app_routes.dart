import 'package:assignmentapp/screens/home_page.dart';
import 'package:assignmentapp/screens/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';

  static final routes = [
    GetPage(name: splash, page: () => const SplashScreen(), 
    ),
    GetPage(name: home, page: () => const HomePage(),
    ),
  ];
}
