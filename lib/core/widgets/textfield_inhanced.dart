import 'package:ashghal/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
class LogTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final bool obscureText;
  final String obsecureChar;

  const LogTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
    required this.obscureText,
    required this.obsecureChar,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'هذا الحقل مطلوب';
          }
          return null;
        },
        controller: controller,
        obscureText: obscureText,
        enableSuggestions: !obscureText,
        autocorrect: !obscureText,
        keyboardType: TextInputType.text,
        textInputAction:
        obscureText ? TextInputAction.done : TextInputAction.next,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon , color: AppColors.primary),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

