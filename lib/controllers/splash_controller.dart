import 'package:get/get.dart';
import 'package:assignmentapp/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Start a timer and navigate to the next page
    _navigateToNextPage();
  }

  // Function to navigate after a delay
  void _navigateToNextPage() async {
    await Future.delayed(const Duration(seconds: 3)); // Delay of 3 seconds
    Get.offAllNamed(AppRoutes.onboarding); // Navigate to Onboarding screen
  }
}
