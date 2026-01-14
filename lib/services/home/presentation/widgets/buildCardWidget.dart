import 'package:ashghal/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class Buildcardwidget extends StatelessWidget {
   Buildcardwidget({
    super.key,required this.imagePath, required this.title,
  });
  final String imagePath;
 final  String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            imagePath,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          textDirection: TextDirection.rtl,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }

}

