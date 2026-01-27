import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key, this.onTap});

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "تمتلك حساب بالفعل؟ ",
          style: AppTextStyles.semibold16.copyWith(
            color: const Color(0xff949D9E),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            "تسجيل دخول",
            style: AppTextStyles.semibold16.copyWith(
              color: const Color(0xff1B5E37),
            ),
          ),
        ),
      ],
    );
  }
}
