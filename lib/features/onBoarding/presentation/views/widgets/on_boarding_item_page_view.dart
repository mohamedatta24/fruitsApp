import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';
import 'package:fruits_app/features/onBoarding/presentation/views/widgets/on_boarding_item.dart';

class OnBoardingItemPageView extends StatelessWidget {
  const OnBoardingItemPageView({super.key, required this.controller, this.onPageChanged});

  final PageController controller;
  final void Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      onPageChanged: onPageChanged,
      children: [
        OnBoardingItem(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "مرحبًا بك في",
                style: AppTextStyles.bold23.copyWith(
                  color: const Color(0xff0C0D0D),
                ),
              ),
              Text(
                " HUB",
                style: AppTextStyles.bold23.copyWith(
                  color: const Color(0xffF4A91F),
                ),
              ),
              Text(
                "Fruit",
                style: AppTextStyles.bold23.copyWith(
                  color: const Color(0xff1B5E37),
                ),
              ),
            ],
          ),
          subTitle:
              "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
          isVisible: true,
          backgroundImage: Assets.imagesBackgroundOnBoarding1,
          image: Assets.imagesImageOnBoarding1,
        ),
        OnBoardingItem(
          title: Text(
            "ابحث وتسوق",
            style: AppTextStyles.bold23.copyWith(
              color: const Color(0xff0C0D0D),
            ),
          ),
          subTitle:
              "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
          isVisible: false,
          backgroundImage: Assets.imagesBackgroundOnBoarding2,
          image: Assets.imagesImageOnBoarding2,
        ),
      ],
    );
  }
}
