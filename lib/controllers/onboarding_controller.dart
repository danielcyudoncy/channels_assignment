import 'package:get/get.dart';
import '../routes/app_routes.dart'; // Import AppRoutes

class OnboardingScreenController extends GetxController {
  // Onboarding data for the screens (can be expanded with multiple steps in the future)
  final onboardingData = {
    "title": "Welcome!",
    "text": "Thanks for joining! Access or create your account below, and get started on your journey!",
  };

  // Navigate to the next screen (Home or Dashboard) when "Get Started" is pressed
  void onGetStarted() {
    // Replacing all routes and pushing to the home screen (adjust route if needed)
    Get.offAllNamed(AppRoutes.authScreen); // Ensure AppRoutes.getStarted is defined in routes
  }

  // Navigate to the account-related page or home screen when "My Account" is pressed
  void onMyAccount() {
    // Replacing all routes and navigating to the home screen or My Account
    Get.offAllNamed(AppRoutes.home); // Ensure AppRoutes.home is defined in routes
  }

  // Skip the onboarding process and go directly to the home screen
  void skipOnboarding() {
    // Replacing all routes and going straight to the home screen
    Get.offAllNamed(AppRoutes.home); // Ensure AppRoutes.home is defined in routes
  }
}
