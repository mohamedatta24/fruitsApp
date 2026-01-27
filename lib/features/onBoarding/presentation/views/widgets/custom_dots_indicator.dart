import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class CustomDotsIndicator extends StatelessWidget {
  const CustomDotsIndicator({super.key, required this.currentPage});

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 2,
      decorator: DotsDecorator(
        activeColor: Color(0xff1B5E37),
        color: currentPage == 1
            ? Color(0xff1B5E37)
            : Color(0xff1B5E37).withOpacity(0.4),
      ),
    );
  }
}
