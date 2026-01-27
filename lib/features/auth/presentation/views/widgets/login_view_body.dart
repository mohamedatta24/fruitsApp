import 'package:flutter/material.dart';
import 'package:fruits_app/core/router/app_router_name.dart';
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/core/utils/app_padding.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/custom_divider.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/custom_text.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/dont_have_an_account.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/forgot_password.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/social_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.horizontal16,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            CustomText(title: "تسجيل دخول"),
            const SizedBox(height: 32.0),
            CustomTextFormField(
              hintText: "البريد الإلكتروني",
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16.0),
            CustomTextFormField(
              hintText: "كلمة المرور",
              suffixIcon: Icon(
                Icons.remove_red_eye,
                color: const Color(0xffC9CECF),
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 16.0),
            ForgotPassword(onTap: () {}),
            const SizedBox(height: 32.0),
            const CustomButton(text: "تسجيل دخول"),
            const SizedBox(height: 32.0),
            DontHaveAnAccount(
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  AppRouterName.signupView,
                );
              },
            ),
            const SizedBox(height: 50.0),
            const CustomDivider(),
            const SizedBox(height: 16.0),
            const SocialButton(
              image: Assets.imagesSocialGoogle,
              title: "تسجيل بواسطة جوجل",
            ),
            const SizedBox(height: 16.0),
            const SocialButton(
              image: Assets.imagesSocialApple,
              title: "تسجيل بواسطة أبل",
            ),
            const SizedBox(height: 16.0),
            const SocialButton(
              image: Assets.imagesSocialFacebook,
              title: "تسجيل بواسطة فيسبوك",
            ),
            const SizedBox(height: 32.0),
          ],
        ),
      ),
    );
  }
}
