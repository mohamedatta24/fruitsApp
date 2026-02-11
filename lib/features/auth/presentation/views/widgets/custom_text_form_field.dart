import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    required this.hintText,
    this.suffixIcon,
    this.keyboardType,
    this.onChanged,
    this.obscureText = false,
  });
  final TextEditingController? controller;
  final String hintText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "الاسم مطلوب";
        }
        return null;
      },
      onChanged: onChanged,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        fillColor: const Color(0xffF9FAFA),
        filled: true,
        hintText: hintText,
        hintStyle: AppTextStyles.bold13.copyWith(
          color: const Color(0xff949D9E),
        ),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        border: buildOutlineInputBorder(),
        disabledBorder: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(width: 1.5, color: const Color(0xffE6E9EA)),
    );
  }
}
