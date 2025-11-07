import 'package:flutter/material.dart';

import '../constants/app_strings/app_strings.dart';
import '../styles/app_colors.dart';

class CustomPasswordField extends StatelessWidget {
  const CustomPasswordField({
    required this.hint,
    required this.label,
    required this.controller,
    required this.isConfirm,
    this.isLogin = true,
    this.compareWith,
    this.textInputAction,
    super.key,
  });

  final String hint;
  final String label;
  final TextInputAction? textInputAction;
  final TextEditingController controller;
  final bool isLogin;
  final bool isConfirm;
  final TextEditingController? compareWith;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      cursorColor: AppColors.kBlackColor,
      controller: controller,
      validator: isLogin ? _validateSignInPassword : _validateSignUpPassword,
      autocorrect: false,
      textInputAction: textInputAction ?? TextInputAction.next,
      decoration: InputDecoration(hintText: hint, labelText: label),
    );
  }

  String? _validateSignInPassword(value) {
    if (value == null || value.isEmpty) {
      return AppStrings.fieldRequired.replaceFirst(
        '{field}',
        label.toLowerCase(),
      );
    }
    if (value.length < 8) return AppStrings.passwordMin;
    return null;
  }

  String? _validateSignUpPassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.fieldRequired.replaceFirst(
        '{field}',
        label.toLowerCase(),
      );
    }

    final specialPasswordRegex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$',
    );

    // Only check match when NOT confirm password field
    if (!isConfirm) {
      if (!specialPasswordRegex.hasMatch(value)) {
        return AppStrings.fieldInvalid.replaceFirst(
          '{field}',
          AppStrings.passwordLabel.toLowerCase(),
        );
      }
    }

    // Confirm password validation
    if (isConfirm && value != compareWith?.text) {
      return AppStrings.passwordMismatch;
    }

    return null;
  }
}
