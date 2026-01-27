import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "لا تمتلك حساب؟ ",
          style: AppTextStyles.semibold16.copyWith(
            color: const Color(0xff949D9E),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            "قم بإنشاء حساب",
            style: AppTextStyles.semibold16.copyWith(
              color: const Color(0xff1B5E37),
            ),
          ),
        ),
      ],
    );
  }
}
