import 'package:assignmentapp/screens/saved_success_screen.dart';
import 'package:assignmentapp/utils/constants/app_colors.dart';
import 'package:assignmentapp/utils/constants/app_fonts_family.dart';
import 'package:assignmentapp/utils/constants/app_sizes.dart';
import 'package:assignmentapp/utils/validators/app_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:assignmentapp/controllers/update_account_controller.dart';
  

class UpdateAccountScreen extends GetView<UpdateAccountController> {
  const UpdateAccountScreen({super.key});

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
                        const Text('Update Account',
                        style: TextStyle(fontFamily: AppFontsStyles.montserrat,
                        fontSize: AppSizes.titleLarge,
                        fontWeight: FontWeight.bold,
                      color: Colors.black,),),
                      const SizedBox(height: 10),
                      const Text('Adjust the content below to update your profile'),
                      const SizedBox(height: 30),
                      
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
            side: const BorderSide(color: Colors.blue, width: 1),
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
        color: const Color.fromRGBO(169, 169, 169, 0.3),
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
          color: const Color.fromRGBO(169, 169, 169, 0.3),
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
              value: 'Assignment Head',
              child: Text('Assignment Head'),
            ),
            DropdownMenuItem(
              value: 'HODs',
              child: Text('HODs'),
            ),
            DropdownMenuItem(
              value: 'DOPs',
              child: Text('DOPs'),
            ),
          ],
        ),
      );
    });
  }

  // Save Changes Button
    // Save Changes Button
  Widget _buildSaveButton() {
    return Obx(() => SizedBox(
      width: double.infinity,  // Ensure the button takes full width
      child: ElevatedButton(
        onPressed: controller.isLoading.value
            ? null
            : () {
                // Using the AppValidator methods to validate email and phone
                String? emailError = AppValidator.validateEmail(controller.email.value);
                String? phoneError = AppValidator.validatePhone(controller.phoneNumber.value);

                if (emailError == null && phoneError == null) {
                  Get.to(() => const SavedSuccessScreen());
                } else {
                  // Show validation error messages
                  String errorMessage = '';
                  if (emailError != null) errorMessage += '$emailError\n';
                  if (phoneError != null) errorMessage += phoneError;

                  Get.snackbar(
                    "Invalid Input",
                    errorMessage,
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: AppColors.errorRed,
                    colorText: Colors.white,
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
      ),
    ));
  }

}
