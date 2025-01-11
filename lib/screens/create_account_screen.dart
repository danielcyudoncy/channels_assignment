import 'package:assignmentapp/utils/constants/app_colors.dart';
import 'package:assignmentapp/widget/image_picker_widget.dart';
import 'package:assignmentapp/widget/role_dropdown_widget.dart';
import 'package:assignmentapp/widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:assignmentapp/controllers/create_account_controller.dart';
import 'package:assignmentapp/screens/update_account_screen.dart';

class CreateAccountScreen extends GetView<CreateAccountController> {
  const CreateAccountScreen({super.key});

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
                  _buildLogo(),
                  const SizedBox(height: 80),
                  _buildForm(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Reusable method to build the logo
  Widget _buildLogo() {
    return const Image(
      image: AssetImage('assets/png/logo.png'),
      height: 150,
    );
  }

  // Reusable method for form container
  Widget _buildForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTitle('Create Account'),
          const SizedBox(height: 10),
          _buildSubtitle('Adjust the content below to update your profile.'),
          const SizedBox(height: 22),

          // Image Placeholder & Change Image Button
          buildImagePicker(context, controller),

          const SizedBox(height: 55),

          // Full Name Field
          buildTextField(
            labelText: 'Full Name',
            hintText: 'Enter your full name',
            onChanged: (value) {
              controller.fullName.value = value;
            },
            icon: Icons.account_circle,
          ),
          const SizedBox(height: 23),

          // Role Dropdown
          buildRoleDropdown(controller),
          const SizedBox(height: 17),

          // Save & Continue Button
          buildSaveButton(context),
        ],
      ),
    );
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

  // Save & Continue Button
  Widget buildSaveButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Validate the form before navigation
        if (controller.validateForm()) {
          // Navigate to the UpdateAccountScreen after validation
          Get.to(() => const UpdateAccountScreen());
        } else {
          // Optionally show an error message when validation fails
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please fill in all fields correctly.')),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor, // Set your button color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: const Text(
        'Save & Continue',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
