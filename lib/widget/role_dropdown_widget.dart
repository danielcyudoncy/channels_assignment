import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:assignmentapp/controllers/create_account_controller.dart';

Widget buildRoleDropdown(CreateAccountController controller) {
  return Container(
    decoration: BoxDecoration(
      color: const Color.fromRGBO(169, 169, 169, 0.3),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Obx(() => DropdownButtonFormField<String>(
      value: controller.role.value.isEmpty ? null : controller.role.value,
      onChanged: (newValue) {
        controller.role.value = newValue!;
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
        prefixIcon: const Icon(Icons.account_circle),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    )),
  );
}
