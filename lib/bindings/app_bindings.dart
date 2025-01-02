import 'package:assignmentapp/controllers/auth_controller.dart';
import 'package:assignmentapp/controllers/create_account_controller.dart';
import 'package:assignmentapp/controllers/onboarding_controller.dart';
import 'package:assignmentapp/controllers/splash_controller.dart';
import 'package:get/get.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<OnboardingScreenController>(() => OnboardingScreenController());
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<CreateAccountController>(() => CreateAccountController());
  } 
}
