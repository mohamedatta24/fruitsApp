import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
      title,
        style: AppTextStyles.bold19.copyWith(color: const Color(0xff0C0D0D)),
      ),
    );
  }
}
