import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    super.key,
    required this.onChanged,
    required this.value,
  });

  final ValueChanged<bool> onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => onChanged(!value),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            width: 24.0,
            height: 24.0,
            decoration: BoxDecoration(
              color: value ? const Color(0xff1B5E37) : Colors.transparent,
              borderRadius: BorderRadius.circular(7.0),
              border: Border.all(
                color: value
                    ? const Color(0xff1B5E37)
                    : const Color(0xffDDDFDF),
                width: 1.5,
              ),
            ),

            child: value
                ? Center(child: SvgPicture.asset(Assets.imagesCheck))
                : null,
          ),
        ),
        const SizedBox(width: 15.0),
        Text(
          "من خلال إنشاء حساب ، فإنك توافق على ",
          style: AppTextStyles.semibold13.copyWith(
            color: const Color(0xff949D9E),
          ),
        ),
        Text(
          "الشروط والأحكام الخاصة بنا",
          style: AppTextStyles.semibold13.copyWith(
            color: const Color(0xff2D9F5D),
          ),
        ),
      ],
    );
  }
}
