import 'package:assignmentapp/screens/home_page.dart';
import 'package:assignmentapp/utils/constants/app_colors.dart';
import 'package:assignmentapp/utils/constants/app_fonts_family.dart';
import 'package:assignmentapp/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:assignmentapp/controllers/saved_success_controller.dart';  // Import the controller
  // Import the home screen

class SavedSuccessScreen extends StatelessWidget {
  const SavedSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final SavedSuccessController controller = Get.put(SavedSuccessController());

    // Example input data (replace with real input data)
    String email = "test@example.com"; // Replace with actual user input
    String phone = "12345678901";      // Replace with actual user input

    // Call validation logic as the screen is loaded
    controller.validateInputs(email, phone);

    // Navigate to Home after a 2-second delay
    Future.delayed(const Duration(seconds: 2), () {
      if (controller.inputsAreValid.value) {
        Get.off(() => const HomePage()); // Replace with your actual home screen widget
      } else {
        // Optionally handle failure case if inputs are invalid
        Get.snackbar(
          "Invalid Input",
          "Please ensure all fields are correctly filled.",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    });

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/png/backgroundColor.png'),
            fit: BoxFit.cover,
          ),
        ),
        height: double.infinity,
        width: double.infinity,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo Image
                  const Image(
                    image: AssetImage('assets/png/logo.png'),
                    height: 150,
                  ),
                  const SizedBox(height: 50),

                  // White container holding the success message and icon
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 120),
                        // Success Icon
                        Image.asset(
                          "assets/icons/check_circle.png", // Path to the check-circle icon
                          height: 150,    // Adjust height as needed
                          width: 150,     // Adjust width as needed
                        ),
                        const SizedBox(height: 30),
                        // Success Text
                        const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Changes Saved Successfully!',
                            style: TextStyle(
                              fontFamily: AppFontsStyles.montserrat,
                              fontSize: AppSizes.titleSmall,
                              fontWeight: FontWeight.bold,
                              color: AppColors.saveColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 70),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
