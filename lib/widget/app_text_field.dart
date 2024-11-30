import 'package:assignmentapp/utils/constants/app_colors.dart';
import 'package:assignmentapp/utils/constants/app_fonts_family.dart';
import 'package:assignmentapp/utils/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key, 
    required this.header, 
    required this.hint, 
    required this.controller, 
    required this.validator, 
    required this.inputType, 
    required this.isHidden, 
    this.onChanged, 
    this.hintColor
  });

  final String header, hint;
  final Color? hintColor;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final TextInputType inputType;
  final bool isHidden;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            header,
            style: TextStyle(
              fontSize: AppSizes.fontNormal,
              fontFamily: AppFontsStyles.openSans,
              fontWeight: FontWeight.normal,
              color: hintColor
            )
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: TextFormField(
            obscureText: isHidden,

            onChanged: onChanged,

            controller: controller,

            validator: validator,

            keyboardType: inputType,
            
            style: const TextStyle(
              fontSize: AppSizes.fontNormal,
              fontWeight: FontWeight.w500,
              fontFamily: AppFontsStyles.openSans
            ),

            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                fontSize: AppSizes.fontNormal,
                fontFamily: AppFontsStyles.openSans,
                fontWeight: FontWeight.w400,
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: const BorderSide(
                  width: 1.0,
                  color: AppColors.white
                )
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: const BorderSide(
                  width: 1.0,
                  color: AppColors.black
                )
              )
            ),
          ),
        )
      ],
    );
  }
}