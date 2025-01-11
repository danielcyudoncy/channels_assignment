import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:assignmentapp/utils/constants/app_colors.dart';
import 'package:assignmentapp/controllers/create_account_controller.dart';
import 'dart:io';
import 'package:get/get.dart';

Widget buildImagePicker(BuildContext context, CreateAccountController controller) {
  final ImagePicker picker = ImagePicker();

  return Column(
    children: [
      Obx(() {
        // Wrap CircleAvatar with a Container to add a border
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,  // Make the border circular
            border: controller.profileImage.value.isEmpty
                ? Border.all(color: AppColors.primaryColor, width: 2)  // Outline when no image is picked
                : null,  // No border if image is available
          ),
          child: CircleAvatar(
            radius: 50,
            backgroundImage: controller.profileImage.value.isEmpty
                ? const AssetImage('assets/png/placeholder_image.png') as ImageProvider
                : FileImage(File(controller.profileImage.value)) as ImageProvider,
            child: controller.profileImage.value.isEmpty
                ? const Icon(Icons.camera_alt, color: AppColors.primaryColor)
                : null,
          ),
        );
      }),
      const SizedBox(height: 16),
      TextButton(
        onPressed: () async {
          // Check if the widget is still mounted before performing the async operation
          if (!context.mounted) return;

          // Show the dialog and pick the image
          final XFile? pickedImage = await showDialog<XFile>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Pick an image'),
              actions: [
                TextButton(
                  onPressed: () async {
                    // Check if widget is still mounted
                    if (context.mounted) {
                      Navigator.pop(context, await picker.pickImage(source: ImageSource.gallery));
                    }
                  },
                  child: const Text('Gallery'),
                ),
                TextButton(
                  onPressed: () async {
                    // Check if widget is still mounted
                    if (context.mounted) {
                      Navigator.pop(context, await picker.pickImage(source: ImageSource.camera));
                    }
                  },
                  child: const Text('Camera'),
                ),
              ],
            ),
          );

          // After the image is picked, check if widget is still mounted
          if (pickedImage != null && context.mounted) {
            controller.profileImage.value = pickedImage.path; // Store image path in controller
            print('Picked image path: ${controller.profileImage.value}');
          }
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.grey[300],
          side: const BorderSide(color: Colors.blue, width: 1),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          'Change Photo',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 16,
          ),
        ),
      ),
    ],
  );
}
