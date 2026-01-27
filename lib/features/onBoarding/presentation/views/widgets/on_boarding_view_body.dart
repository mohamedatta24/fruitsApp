import 'package:flutter/material.dart';
import 'package:fruits_app/constants.dart';
import 'package:fruits_app/core/router/app_router_name.dart';
import 'package:fruits_app/core/services/shared_preferences.dart';
import 'package:fruits_app/core/utils/app_padding.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/features/onBoarding/presentation/views/widgets/custom_dots_indicator.dart';
import 'package:fruits_app/features/onBoarding/presentation/views/widgets/on_boarding_item_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnBoardingItemPageView(
            controller: pageController,
            onPageChanged: (value) {
              currentPage = value;
            },
          ),
        ),
        CustomDotsIndicator(currentPage: currentPage),
        const SizedBox(height: 32.0),
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: currentPage == 1 ? true : false,
          child: Padding(
            padding: AppPadding.horizontal16,
            child: CustomButton(
              text: "",
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  AppRouterName.loginView,
                );
                SharedPref.setBool(kIsOnBoardingViewSeen, true);
              },
            ),
          ),
        ),
        const SizedBox(height: 50.0),
      ],
    );
  }
}
