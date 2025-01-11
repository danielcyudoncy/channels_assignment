import 'package:assignmentapp/utils/constants/app_colors.dart';
import 'package:assignmentapp/utils/constants/app_fonts_family.dart';
import 'package:assignmentapp/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class SavedSuccessScreen extends StatelessWidget {
  const SavedSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                          "assets/icons/check_circle.png",  // Path to the check-circle icon
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
