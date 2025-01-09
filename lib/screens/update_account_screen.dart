import 'package:assignmentapp/screens/create_account_screen.dart';
import 'package:assignmentapp/utils/constants/app_colors.dart';
import 'package:assignmentapp/widget/image_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:assignmentapp/controllers/update_account_controller.dart'; // Import the new controller

class UpdateAccountScreen extends GetView<UpdateAccountController> {
  const UpdateAccountScreen({super.key});

  // Email Validation Logic (Basic Email Regex)
  bool _isValidEmail(String email) {
    String pattern = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  // Phone Validation Logic (Basic Phone Number Regex)
  bool _isValidPhoneNumber(String phoneNumber) {
    String pattern = r"^\+?[1-9]\d{1,14}$"; // Example of international phone number format
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(phoneNumber);
  }

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
                  const Image(
                    image: AssetImage('assets/png/logo.png'),
                    height: 150,
                  ),
                  const SizedBox(height: 80),

                  // Container for all form elements
                  Container(
                    height: 700, // Increased height to accommodate phone number field
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildTitle('Update Account'),
                        const SizedBox(height: 10),
                       _buildSubtitle('Adjust the content below to update your profile.'),
                        const SizedBox(height: 22),

                     
                        
                        const SizedBox(height: 30),

                        // Email TextField
                        _buildTextField(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          onChanged: controller.setEmail,
                          icon: Icons.email,
                        ),
                        const SizedBox(height: 30),

                        // Phone Number TextField
                        _buildTextField(
                          labelText: 'Phone Number',
                          hintText: 'Enter your phone number',
                          onChanged: controller.setPhoneNumber,
                          icon: Icons.phone,
                        ),
                        const SizedBox(height: 30),

                        // Password TextField
                        _PasswordTextField(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          onChanged: controller.setPassword,
                        ),
                        const SizedBox(height: 30),

                        

                        Obx(() => ElevatedButton(
                          onPressed: controller.isLoading.value ? null : () {
                            String email = controller.email.value;
                            String phone = controller.phoneNumber.value;
                            if (_isValidEmail(email) && _isValidPhoneNumber(phone)) {
                              // If email and phone number are valid, navigate to the Create Account screen
                              Get.to(() => const CreateAccountScreen());
                            } else {
                              // Show error message if email or phone is invalid
                              Get.snackbar(
                                "Invalid Input",
                                "Please enter valid email and phone number.",
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
                              : const Text('Save  Changes'),
                        )),
                        const SizedBox(height: 24),
                        
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
        color: Colors.grey.withOpacity(0.3),
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
          height: 50,
          width: 50,
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
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        onChanged: widget.onChanged,
        obscureText: _obscureText,
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          prefixIcon: const Icon(Icons.lock),
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
 // Reusable method to build title
  Widget _buildTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Montserrat', 
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      textAlign: TextAlign.center,
    );
  }

  // Reusable method to build subtitle
  Widget _buildSubtitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'OpenSans',
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      textAlign: TextAlign.center,
    );
  }
