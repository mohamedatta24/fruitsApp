import 'package:flutter/material.dart';
import 'package:fruits_app/core/router/app_router_name.dart';
import 'package:fruits_app/core/utils/app_padding.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/already_have_an_account.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/custom_text.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/terms_and_conditions_text.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

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
            const CustomText(title: "حساب جديد"),
            const SizedBox(height: 32.0),
            const CustomTextFormField(
              hintText: "الاسم كامل",
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 16.0),
            const CustomTextFormField(
              hintText: "البريد الإلكتروني",
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16.0),
            const CustomTextFormField(
              keyboardType: TextInputType.text,
              hintText: "كلمة المرور",
              suffixIcon: Icon(Icons.remove_red_eye, color: Color(0xffC9CECF)),
            ),
            const SizedBox(height: 16.0),
            const TermsAndConditions(),
            const SizedBox(height: 32.0),
            CustomButton(text: "إنشاء حساب جديد", onTap: () {}),
            const SizedBox(height: 32.0),
            AlreadyHaveAnAccount(
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  AppRouterName.loginView,
                );
              },
            ),
            const SizedBox(height: 32.0),
          ],
        ),
      ),
    );
  }
}
