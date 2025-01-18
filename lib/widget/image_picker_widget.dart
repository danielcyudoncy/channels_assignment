import 'dart:io';

import 'package:assignmentapp/controllers/create_account_controller.dart';
import 'package:assignmentapp/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_picker/image_picker.dart';

Widget buildImagePicker(BuildContext context, CreateAccountController controller) {
  final ImagePicker picker = ImagePicker();

  return Column(
    children: [
      Obx(() {
        // Use FileImage to load the selected image
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle, 
            border: controller.profileImage.value.isEmpty
                ? Border.all(color: AppColors.primaryColor, width: 2)
                : null,
          ),
          child: CircleAvatar(
            radius: 50,
            backgroundImage: controller.profileImage.value.isEmpty
                ? const AssetImage('assets/png/placeholder_image.png') as ImageProvider
                : FileImage(File(controller.profileImage.value)),  // Ensure it's FileImage
            child: controller.profileImage.value.isEmpty
                ? const Icon(Icons.camera_alt, color: AppColors.primaryColor)
                : null,
          ),
        );
      }),
      const SizedBox(height: 16),
      TextButton(
        onPressed: () async {
          final pickedImage = await _showImagePickerDialog(context, picker);
          if (pickedImage != null) {
            controller.profileImage.value = pickedImage.path;
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

Future<XFile?> _showImagePickerDialog(BuildContext context, ImagePicker picker) {
  return showDialog<XFile?>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Pick an image'),
        actions: [
          TextButton(
            onPressed: () async {
              final XFile? picked = await picker.pickImage(source: ImageSource.gallery);
              if (context.mounted) {
                Navigator.of(context).pop(picked);  // Close dialog with the picked image
              }
            },
            child: const Text('Gallery'),
          ),
          TextButton(
            onPressed: () async {
              final XFile? picked = await picker.pickImage(source: ImageSource.camera);
              if (context.mounted) {
                Navigator.of(context).pop(picked);  // Close dialog with the picked image
              }
            },
            child: const Text('Camera'),
          ),
        ],
      );
    },
  );
}