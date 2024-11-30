import 'package:assignmentapp/widget/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/get_started_controller.dart'; // Import the GetStartedScreenController
import '../utils/constants/app_colors.dart'; // Custom colors for your app
import '../utils/validators/app_validator.dart'; // Import the AppValidator

class GetStartedScreen extends GetView<GetStartedScreenController> {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a TextEditingController for email and password
     GlobalKey<FormState> formKey = GlobalKey();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      // Background color
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/png/backgroundColor.png'), // Path to your background image
            fit: BoxFit.cover, // Ensures the image covers the entire background
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Header Section with Logo
              const Column(
                children: [
                  SizedBox(height: 40),
                  Image(
                    image: AssetImage('assets/png/logo.png'), // Your logo
                    height: 180,
                  ),
                  SizedBox(height: 10),
                ],
              ),
              const SizedBox(height: 40), // Spacer between logo and text

              // Form Container
              Container(
                height: 600,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // "Get Started" Text
                    const Center(
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), // Spacer between text and form fields

                    // Email TextField
                    Padding(
                padding: const EdgeInsets.only(top: 29.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      AppTextField(
                        label: "Email", 
                        hint: "Enter Email address", 
                        controller: emailController, 
                        validator: (email) => AppValidator.validateEmail(email), 
                        inputType: TextInputType.emailAddress,
                        isHidden: false,
                      ),
          
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: AppTextField(
                          label: "Password", 
                          hint: "Enter password", 
                          controller: passwordController, 
                          validator: (password) => AppValidator.validateTextState(password), 
                          inputType: TextInputType.text,
                          isHidden: true,
                        ),
                      ),
                    const SizedBox(height: 20), // Spacer between fields

                    // Create Account Button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Validate email and password using AppValidator
                          String? emailError = AppValidator.validateEmail(emailController.text);
                          String? passwordError = AppValidator.validatePassword(passwordController.text);

                          if (emailError != null) {
                            // Show error message for email validation
                            Get.snackbar("Error", emailError,
                                backgroundColor: Colors.red,
                                colorText: Colors.white);
                          } else if (passwordError != null) {
                            // Show error message for password validation
                            Get.snackbar("Error", passwordError,
                                backgroundColor: Colors.red,
                                colorText: Colors.white);
                          } else {
                            // If both fields are valid, proceed with account creation
                            controller.onGetStarted();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 15),
                          backgroundColor: AppColors.saveColor, // Button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Create Account',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              
              // Optionally add a footer or image if needed
            ),
             ] ),
        ),
      ]),
      ),),);
  }
}
