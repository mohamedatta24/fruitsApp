import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/constants.dart';
import 'package:fruits_app/core/router/app_router_name.dart';
import 'package:fruits_app/core/services/shared_preferences.dart';
import 'package:fruits_app/core/utils/app_padding.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({
    super.key,
    required this.backgroundImage,
    required this.image,
    required this.isVisible,
    required this.title,
    required this.subTitle,
  });

  final String backgroundImage;
  final String image;
  final bool isVisible;
  final Widget title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(backgroundImage, fit: BoxFit.fill),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: SvgPicture.asset(image),
              ),

              Visibility(
                visible: isVisible,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      AppRouterName.loginView,
                    );
                    SharedPref.setBool(kIsOnBoardingViewSeen, true);
                  },
                  child: Padding(
                    padding: AppPadding.horizontal16,
                    child: Text(
                      "تخط",
                      style: AppTextStyles.regular13.copyWith(
                        color: const Color(0xff616A6B),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 65),
        title,
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Text(
            textAlign: TextAlign.center,
            subTitle,
            style: AppTextStyles.semibold13.copyWith(
              color: const Color(0xff4E5556),
            ),
          ),
        ),
      ],
    );
  }
}
