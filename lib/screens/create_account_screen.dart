import 'package:assignmentapp/controllers/create_account_controller.dart'; 
import 'package:assignmentapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart'; // Import image_picker package
import 'dart:io'; // To work with image files

class CreateAccountScreen extends GetView<CreateAccountController> {
   CreateAccountScreen({super.key});

  // ImagePicker instance to pick images from the gallery or camera
  final ImagePicker _picker = ImagePicker();

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
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Create Account',
                          style: TextStyle(
                            fontFamily: 'Montserrat', 
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Adjust the content below to update your profile.',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 22),  // Added space for the image placeholder

                        // Image Placeholder & Change Image Button
                        _buildImagePicker(),

                        const SizedBox(height: 55),

                        // Full Name Field
                        _buildTextField(
                          labelText: 'Full Name',
                          hintText: 'Enter your fullName',
                          onChanged: (value) {
                            controller.email.value = value;
                          },
                          icon: Icons.account_circle,
                        ),
                        const SizedBox(height: 23),

                        // Role Dropdown
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Obx(() => DropdownButtonFormField<String>(
                            value: controller.role.value.isEmpty ? null : controller.role.value,
                            onChanged: (String? newValue) {
                              controller.role.value = newValue ?? '';
                            },
                            items: <String>['Admin', 'Assignment Head', 'HODs', 'DOPs']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            decoration: InputDecoration(
                              labelText: 'Role',
                              hintText: 'Select your role',
                              prefixIcon: const Icon(Icons.account_circle),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            ),
                          )),
                        ),
                        const SizedBox(height: 17),

                        // Save & Continue Button
                        Obx(() => ElevatedButton(
                          onPressed: controller.isLoading.value ? null : controller.createAccount,
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
                              : const Text('Save & Continue'),
                        )),
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

  // Helper method to build the image placeholder and button
  Widget _buildImagePicker() {
    return Column(
      children: [
        // Placeholder for the image (or the actual image if one is selected)
        Obx(() {
          return CircleAvatar(
            radius: 50,
            backgroundImage: controller.profileImage.value.isEmpty
                ? const AssetImage('assets/png/placeholder_image.png') // Placeholder image
                : FileImage(File(controller.profileImage.value)) as ImageProvider,
            child: controller.profileImage.value.isEmpty
                ? const Icon(Icons.camera_alt, color: AppColors.primaryColor) // Camera icon when no image is set
                : null,
          );
        }),
        const SizedBox(height: 16),
        // Change Image Button
        TextButton(
  onPressed: () async {
    // Show dialog to pick image from gallery or camera
    final XFile? pickedImage = await _picker.pickImage(
      source: ImageSource.gallery, // Or ImageSource.camera for camera
    );

    if (pickedImage != null) {
      // Update the controller with the picked image file path
      controller.profileImage.value = pickedImage.path;
    }
  },
  style: TextButton.styleFrom(
    backgroundColor: Colors.grey[300], // Set background color to grey
    side: const BorderSide(color: Colors.grey, width: 1), // Set border (outline) color to black
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20), // Adjust padding if needed
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // Round the corners
    ),
  ),
  child: const Text(
    'Change Image',
    style: TextStyle(
      color: AppColors.black, // Text color
      fontSize: 16,
    ),
  ),
)

      ],
    );
  }

  // Helper method to build the text field
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
