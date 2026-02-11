import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/router/app_router_name.dart';
import 'package:fruits_app/core/utils/app_padding.dart';
import 'package:fruits_app/core/widgets/custom_button.dart';
import 'package:fruits_app/features/auth/presentation/signup_cubit/signup_cubit_cubit.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/already_have_an_account.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/custom_text.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/password_field.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/terms_and_conditions_text.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? name, email, password;
  bool isTermsAccepted = false;
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
              const CustomText(title: "حساب جديد"),
              const SizedBox(height: 32.0),
              CustomTextFormField(
                onChanged: (value) {
                  name = value;
                },
                hintText: "الاسم كامل",
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 16.0),
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
              TermsAndConditions(
                value: isTermsAccepted,
                onChanged: (value) {
                  setState(() {
                    isTermsAccepted = value;
                  });
                },
              ),
              const SizedBox(height: 32.0),
              CustomButton(
                text: "إنشاء حساب جديد",
                onTap: () {
                  if (isTermsAccepted) {
                    if (formKey.currentState!.validate()) {
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                            name!,
                            email!,
                            password!,
                          );
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "فإنك توافق على الشروط والأحكام الخاصة بنا",
                        ),
                      ),
                    );
                  }
                },
              ),
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
      ),
    );
  }
}
