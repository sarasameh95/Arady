import 'package:ashghal/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
class BuildTextField extends StatelessWidget {
   const BuildTextField({super.key, required this.controller,
    required this.label,
    required this.hintText,
    required this.obscureText,});
  final TextEditingController controller;
   final String label;
   final String hintText;
   final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 5.0),
          child: Text(
            label,
            textDirection: TextDirection.rtl,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textColor,

            ),
          ),
        ),
        TextField(
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.end,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.tertiary),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}

