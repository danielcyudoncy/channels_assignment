import 'package:assignmentapp/screens/onboarding_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAll(() => OnboardingScreen()); // Navigate and clear the stack
  }
}
