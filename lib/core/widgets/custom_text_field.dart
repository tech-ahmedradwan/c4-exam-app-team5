import 'package:flutter/material.dart';
import '../styles/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    required this.hint,
    required this.label,
    required this.controller,
    required this.validator,
    this.isPassword = false,
    this.keyboardType,
    this.textInputAction,
    super.key,
  });

  const CustomTextfield.password({
    required this.hint,
    required this.label,
    required this.controller,
    required this.validator,
    this.isPassword = true,
    this.keyboardType,
    this.textInputAction,
    super.key,
  });

  final String hint;
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool? isPassword;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.kBlackColor,
      controller: controller,
      obscureText: isPassword ?? false,
      validator: validator,
      keyboardType: keyboardType ?? TextInputType.text,
      autocorrect: false,
      textInputAction: textInputAction ?? TextInputAction.next,
      decoration: InputDecoration(hintText: hint, labelText: label),
    );
  }
}
