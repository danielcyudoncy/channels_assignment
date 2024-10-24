import 'package:assignmentapp/controllers/splash_controller.dart';
import 'package:assignmentapp/utils/constants/app_colors.dart';
import 'package:assignmentapp/utils/constants/app_fonts_family.dart';
import 'package:assignmentapp/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the SplashController
    Get.put(SplashController());

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/png/logo.png',
              height: 188,
              width: 180,
              semanticLabel: 'App Logo',
            ),
            const SizedBox(height: 20),
            const Text(
              'Your home for news',
              style: TextStyle(
                color: Colors.white,
                fontSize: AppSizes.fontSmall,
                fontFamily: AppFontsStyles.montserrat,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
