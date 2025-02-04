import 'package:assignmentapp/controllers/onboarding_controller.dart';
import 'package:assignmentapp/utils/constants/app_colors.dart';
import 'package:assignmentapp/utils/constants/app_fonts_family.dart';
import 'package:assignmentapp/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class OnboardingScreen extends GetView<OnboardingScreenController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false, // Removes the back button
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/png/backgroundColor.png'), // Path to your background image
            fit: BoxFit.cover, // Ensures the image covers the entire background
          ),
        ),
        child: Column(
          children: [
            // Top spacing and logo
            const SizedBox(height: 60),
            const Image(
              image: AssetImage('assets/png/logo.png'),
              height: 150,
            ),
            const SizedBox(height: 80),
            // Welcome title
            const Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            // Welcome description
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Thanks for joining! Access or create your account below, and get started on your journey!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 350),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                const SizedBox(width: 15),
                ElevatedButton(
                  onPressed: controller.onMyAccount,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    backgroundColor: AppColors.saveColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  child: const Text(
                    'My Account',
                    style: TextStyle(
                      fontFamily: AppFontsStyles.openSans,
                      fontSize: AppSizes.fontNormal,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
