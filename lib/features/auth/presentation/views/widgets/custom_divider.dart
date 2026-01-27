import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: const Color(0xffDDDFDF))),
        const SizedBox(width: 16),
        Text(
          "أو",
          style: AppTextStyles.bold16.copyWith(color: const Color(0xff141F1F)),
        ),
        const SizedBox(width: 16),
        Expanded(child: Divider(color: const Color(0xffDDDFDF))),
      ],
    );
  }
}
