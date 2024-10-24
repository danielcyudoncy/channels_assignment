import 'package:assignmentapp/utils/constants/app_colors.dart';
import 'package:assignmentapp/utils/constants/app_fonts_family.dart';
import 'package:assignmentapp/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingScreen extends GetView<OnboardingScreenController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Background image using BoxDecoration
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/png/backgroundColor.png'), // Replace with your image path
            fit: BoxFit.cover, // Make sure the image covers the screen
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Placeholder for logo or another image
              const Image(
                image: AssetImage('assets/images/onboarding_image.png'), // Replace with actual image
                height: 150,
              ),
              const SizedBox(height: 20),
              // Display the title
              Text(
                controller.onboardingData['title']!,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Text color over the background image
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // Display the content text
              Text(
                controller.onboardingData['text']!,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white, // Text color over the background image
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // "Get Started" and "My Account" buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: controller.onGetStarted,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 28),
                      backgroundColor: AppColors.white, // Button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9), // Adjust this value for border radius
                       
                      ),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontFamily: AppFontsStyles.openSans,
                        fontSize: AppSizes.fontNormal,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black, // Button text color
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: controller.onMyAccount,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 28),
                      backgroundColor: Colors.blue, // Button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9), // Adjust this value for border radius
                        
                      ),
                    ),
                    child: const Text(
                      'My Account',
                      style: TextStyle(
                        fontFamily: AppFontsStyles.openSans,
                        fontSize: AppSizes.fontNormal,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Button text color
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
