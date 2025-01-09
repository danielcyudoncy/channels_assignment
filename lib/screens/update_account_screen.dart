import 'package:assignmentapp/screens/create_account_screen.dart';
import 'package:assignmentapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:assignmentapp/controllers/update_account_controller.dart';

class UpdateAccountScreen extends GetView<UpdateAccountController> {
  const UpdateAccountScreen({super.key});

  // Basic email and phone validation using regular expressions
  bool _isValidEmail(String email) {
    String pattern = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  bool _isValidPhoneNumber(String phoneNumber) {
    String pattern = r"^\+?[1-9]\d{1,14}$"; // International phone number format
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
                  // Logo Image
                  const Image(
                    image: AssetImage('assets/png/logo.png'),
                    height: 150,
                  ),
                  const SizedBox(height: 50),

                  // White container holding the profile image, form, and save button
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Profile Image Section
                        _buildProfileImageSection(),

                        const SizedBox(height: 40),

                        // Form Section (Full Name, Role, Email, Phone)
                        _buildFormSection(),

                        const SizedBox(height: 30),

                        // Save Changes Button
                        _buildSaveButton(),
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

  // Profile Image Section
  Widget _buildProfileImageSection() {
    return Column(
      children: [
        Obx(() => CircleAvatar(
              radius: 50,
              backgroundImage: controller.profileImage.value.isEmpty
                  ? const AssetImage('assets/png/profile_placeholder.png')
                  : NetworkImage(controller.profileImage.value),
            )),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: controller.pickImage,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: const Text('Change Image', style: TextStyle(color: AppColors.white)),
        ),
      ],
    );
  }

  // Form Section (Full Name, Role, Email, Phone)
  Widget _buildFormSection() {
    return Column(
      children: [
        _buildTextField(
          labelText: 'Full Name',
          hintText: 'Enter your full name',
          onChanged: controller.setFullName,
          icon: Icons.person,
        ),
        const SizedBox(height: 20),

        _buildRoleDropdown(),

        const SizedBox(height: 20),

        _buildTextField(
          labelText: 'Email',
          hintText: 'Enter your email',
          onChanged: controller.setEmail,
          icon: Icons.email,
        ),
        const SizedBox(height: 20),

        _buildTextField(
          labelText: 'Phone Number',
          hintText: 'Enter your phone number',
          onChanged: controller.setPhoneNumber,
          icon: Icons.phone,
        ),
      ],
    );
  }

  // Reusable method to build the text input fields
  Widget _buildTextField({
    required String labelText,
    required String hintText,
    required ValueChanged<String> onChanged,
    IconData? icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        onChanged: onChanged,
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

  // Dropdown for Role Selection
  Widget _buildRoleDropdown() {
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: DropdownButtonFormField<String>(
          value: controller.selectedRole.value.isEmpty ? null : controller.selectedRole.value,
          onChanged: controller.setRole, // Updating role value in the controller
          decoration: InputDecoration(
            labelText: 'Role',
            hintText: 'Select your role',
            prefixIcon: const Icon(Icons.work),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
          items: const [
            DropdownMenuItem(
              value: 'Admin',
              child: Text('Admin'),
            ),
            DropdownMenuItem(
              value: 'User',
              child: Text('User'),
            ),
            DropdownMenuItem(
              value: 'Manager',
              child: Text('Manager'),
            ),
          ],
        ),
      );
    });
  }

  // Save Changes Button
  Widget _buildSaveButton() {
    return Obx(() => ElevatedButton(
          onPressed: controller.isLoading.value
              ? null
              : () {
                  if (_isValidEmail(controller.email.value) &&
                      _isValidPhoneNumber(controller.phoneNumber.value)) {
                    Get.to(() => const CreateAccountScreen());
                  } else {
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
              : const Text('Save Changes'),
        ));
  }
}
