import 'package:get/get.dart';
import '../routes/app_routes.dart'; // Import AppRoutes

class OnboardingScreenController extends GetxController {
  final onboardingData = {
    "title": "Welcome!",
    "text": "Thanks for joining! Access or create your account below, and get started on your journey!",
  };

  void onGetStarted() {
    // Navigate to the home screen when "Get Started" is pressed
    Get.offAllNamed(AppRoutes.home);
  }

  void onMyAccount() {
    // Navigate to home screen or account-related page when "My Account" is pressed
    Get.offAllNamed(AppRoutes.home);
  }

  void skipOnboarding() {
    // Navigate to home screen when "Skip" is pressed
    Get.offAllNamed(AppRoutes.home);
  }
}
