import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/get_started_controller.dart'; // Import the GetStartedScreenController
import '../utils/constants/app_colors.dart'; // Custom colors for your app
import '../utils/constants/app_fonts_family.dart'; // Custom fonts
import '../utils/constants/app_sizes.dart'; // Custom sizes

class GetStartedScreen extends GetView<GetStartedScreenController> {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            const Image(
              image: AssetImage('assets/png/logo.png'),
              height: 150,
            ),
            const SizedBox(height: 80),
            // Title Text
            const Text(
              "Get Started",
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            // Description Text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Welcome to the app! Let's get you started on your journey.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(), // Push buttons to the bottom
            // Buttons for navigation
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Back Button to Onboarding Screen
                ElevatedButton(
                  onPressed: controller.onBackToOnboarding,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    backgroundColor: AppColors.saveColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  child: const Text(
                    'Back to Onboarding',
                    style: TextStyle(
                      fontFamily: AppFontsStyles.openSans,
                      fontSize: AppSizes.fontNormal,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                // Get Started Button
                ElevatedButton(
                  onPressed: controller.onGetStarted,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontFamily: AppFontsStyles.openSans,
                      fontSize: AppSizes.fontNormal,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
