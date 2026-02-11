import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utils/app_images.dart';
import 'package:fruits_app/core/utils/app_padding.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/features/auth/presentation/login/login_cubit.dart';
import 'package:fruits_app/features/auth/presentation/views/signup_view.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/custom_divider.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/custom_text.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/dont_have_an_account.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/forgot_password.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/password_field.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/social_button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? email, password;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.horizontal16,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              CustomText(title: "تسجيل دخول"),
              const SizedBox(height: 32.0),
              CustomTextFormField(
                onChanged: (value) {
                  email = value;
                },
                hintText: "البريد الإلكتروني",
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16.0),
              PasswordField(
                onChanged: (value) {
                  password = value;
                },
              ),
              const SizedBox(height: 16.0),
              ForgotPassword(onTap: () {}),
              const SizedBox(height: 32.0),
              CustomButton(
                text: "تسجيل دخول",
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.read<LoginCubit>().signInWithEmailAndPassword(
                      email!,
                      password!,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(height: 32.0),
              DontHaveAnAccount(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignupView();
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 50.0),
              const CustomDivider(),
              const SizedBox(height: 16.0),
              SocialButton(
                onTap: () {
                  context.read<LoginCubit>().signInWithGoogle();
                },
                image: Assets.imagesSocialGoogle,
                title: "تسجيل بواسطة جوجل",
              ),
              const SizedBox(height: 16.0),
              SocialButton(
                onTap: () {
                  context.read<LoginCubit>().signInWithApple();
                },
                image: Assets.imagesSocialApple,
                title: "تسجيل بواسطة أبل",
              ),
              const SizedBox(height: 16.0),
              SocialButton(
                onTap: () {
                  context.read<LoginCubit>().signInWithFacebook();
                },
                image: Assets.imagesSocialFacebook,
                title: "تسجيل بواسطة فيسبوك",
              ),
              const SizedBox(height: 32.0),
            ],
          ),
        ),
      ),
    );
  }
}
