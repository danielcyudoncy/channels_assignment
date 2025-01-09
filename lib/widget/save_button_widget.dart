import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:assignmentapp/utils/constants/app_colors.dart';
import 'package:assignmentapp/controllers/create_account_controller.dart';

Widget buildSaveButton(CreateAccountController controller) {
  return Obx(() => ElevatedButton(
    onPressed: controller.isLoading.value || controller.role.value.isEmpty
        ? null
        : controller.createAccount,
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
  ));
}
