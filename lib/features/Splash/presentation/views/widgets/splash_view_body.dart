import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/constants.dart';
import 'package:fruits_app/core/router/app_router_name.dart';
import 'package:fruits_app/core/services/shared_preferences.dart';
import 'package:fruits_app/core/utils/app_images.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    toNavigation(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: .end,
          children: [SvgPicture.asset(Assets.imagesPlantSplash)],
        ),
        SvgPicture.asset(Assets.imagesLogoSplash),
        SvgPicture.asset(Assets.imagesCirclesSplash, fit: BoxFit.fill),
      ],
    );
  }
}

// ignore: strict_top_level_inference
void toNavigation(context) {
  bool isBoardingViewSeen = SharedPref.getBool(kIsOnBoardingViewSeen);
  Future.delayed(Duration(milliseconds: 3000), () {
    if (isBoardingViewSeen) {
      Navigator.pushReplacementNamed(context, AppRouterName.loginView);
    } else {
      Navigator.pushReplacementNamed(context, AppRouterName.onBoardingView);
    }
  });
}
