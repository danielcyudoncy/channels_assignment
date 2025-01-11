import 'package:assignmentapp/controllers/get_started_controller.dart';
import 'package:assignmentapp/screens/create_account_screen.dart';
import 'package:assignmentapp/utils/constants/app_colors.dart';
import 'package:assignmentapp/utils/constants/app_fonts_family.dart';
import 'package:assignmentapp/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetStartedScreen extends GetView<GetStartedController> {
  const GetStartedScreen({super.key});

  // Email Validation Logic (Basic Email Regex)
  bool _isValidEmail(String email) {
    const pattern = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
    final regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/png/backgroundColor.png'),
            fit: BoxFit.cover, // Ensures the image covers the entire background
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
                  const Image(
                    image: AssetImage('assets/png/logo.png'),
                    height: 150,
                  ),
                  const SizedBox(height: 80),

                  // Container for all form elements
                  Container(
                    height: 600,
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Get Started',
                          style: TextStyle(
                            fontFamily: AppFontsStyles.montserrat,
                            fontSize: AppSizes.titleSmall,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        _buildTextField(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          onChanged: controller.setEmail,
                          icon: Icons.email,
                        ),
                        const SizedBox(height: 30),
                        _PasswordTextField(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          onChanged: controller.setPassword,
                        ),
                        const SizedBox(height: 30),
                        Obx(() => ElevatedButton(
                          onPressed: controller.isLoading.value
                              ? null
                              : () {
                                  final email = controller.email.value;  // Accessing the value of the observable
                                  if (_isValidEmail(email)) {
                                    // If email is valid, navigate to the Create Account screen
                                    Get.to(() => const CreateAccountScreen());
                                  } else {
                                    // Show an error message if email is invalid
                                    Get.snackbar(
                                      "Invalid Email",
                                      "Please enter a valid email address.",
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: AppColors.errorRed,
                                      colorText: Colors.white,
                                    );
                                  }
                                },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: AppColors.primaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: controller.isLoading.value
                              ? const CircularProgressIndicator(color: Colors.white)
                              : const Text('Create Account'),
                        )),
                        const SizedBox(height: 24),
                        const Row(
                          children: [
                            Expanded(child: Divider(color: Colors.black)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                'or sign in with',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            Expanded(child: Divider(color: Colors.black)),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _SocialButton(
                              onTap: controller.signInWithGoogle,
                              icon: 'assets/icons/google.png',
                            ),
                            const SizedBox(width: 16),
                            _SocialButton(
                              onTap: controller.signInWithApple,
                              icon: 'assets/icons/apple.png',
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account? ',
                              style: TextStyle(color: Colors.black),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigate to sign in screen
                              },
                              child: const Text(
                                'Sign in here',
                                style: TextStyle(
                                  color: AppColors.saveColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
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

  // A function to build the text input fields
  Widget _buildTextField({
    required String labelText,
    required String hintText,
    required ValueChanged<String> onChanged,
    IconData? icon,
    bool obscureText = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(169, 169, 169, 0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        onChanged: onChanged,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: icon != null ? Icon(icon) : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final VoidCallback onTap;
  final String icon;

  const _SocialButton({
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.asset(
          icon,
          height: 50,  // Increased icon size to 50
          width: 50,   // Increased icon size to 50
        ),
      ),
    );
  }
}

// Custom Stateful widget to handle password visibility toggle
class _PasswordTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final ValueChanged<String> onChanged;

  const _PasswordTextField({
    required this.labelText,
    required this.hintText,
    required this.onChanged,
  });

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<_PasswordTextField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(169, 169, 169, 0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        onChanged: widget.onChanged,
        obscureText: _obscureText,
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          prefixIcon: const Icon(Icons.lock), // Password icon (lock)
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: _togglePasswordVisibility,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }
}
