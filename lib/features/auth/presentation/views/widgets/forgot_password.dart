import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key, this.onTap});

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        "نسيت كلمة المرور؟",
        style: AppTextStyles.semibold13.copyWith(
          color: const Color(0xff2D9F5D),
        ),
      ),
    );
  }
}
