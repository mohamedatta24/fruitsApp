import 'package:flutter/material.dart';
import 'package:fruits_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.onChanged});

  final void Function(String)? onChanged;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscureText,
      onChanged: widget.onChanged,
      hintText: "كلمة المرور",
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: obscureText
            ? Icon(Icons.visibility_off, color: const Color(0xffC9CECF))
            : Icon(Icons.remove_red_eye, color: const Color(0xffC9CECF)),
      ),
      keyboardType: TextInputType.text,
    );
  }
}
