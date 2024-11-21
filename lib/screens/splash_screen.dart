import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:assignmentapp/controllers/splash_controller.dart';
import 'package:assignmentapp/utils/constants/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize SplashController (This will be done in the controller binding)
    Get.put(SplashController());

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Image
            Image.asset(
              'assets/png/logo.png',
              height: 180,
              width: 180,
              semanticLabel: 'App Logo',
            ),
            const SizedBox(height: 20),
            // Tagline text
            const Text(
              'Your home for news',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Montserrat',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
