import 'package:get/get.dart';
import '../routes/app_routes.dart'; // Import AppRoutes

class GetStartedScreenController extends GetxController {
  // Method to navigate to the Home screen or any desired screen
  void onGetStarted() {
    Get.offAllNamed(AppRoutes.home); // Replace AppRoutes.home with the correct route for your app
  }

  // Method to go back to the Onboarding Screen
  void onBackToOnboarding() {
    Get.offAllNamed(AppRoutes.onboarding);
  }
}
