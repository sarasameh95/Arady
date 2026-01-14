import 'package:ashghal/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
class LogTextField extends StatelessWidget {
   const LogTextField({super.key, required this.controller,
    required this.label,
    required this.icon,
    required this.obscureText,
   required this.obsecureChar});
  final TextEditingController controller;
   final String label;
   final IconData icon;
   final bool obscureText;
   final String obsecureChar ;

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: TextField(
        textAlign: TextAlign.right,
        controller: controller,
        decoration: InputDecoration(border: OutlineInputBorder(),
          labelText: label,
          prefixIcon: Icon(icon,color: AppColors.primary,),),
        obscureText: obscureText,
        obscuringCharacter: obsecureChar,
      ),
    );
  }
}

