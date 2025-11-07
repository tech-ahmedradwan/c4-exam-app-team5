import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings/app_strings.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_text_field.dart';

class SignUpPasswordRow extends StatelessWidget with AppValidators {
  const SignUpPasswordRow({
    required this.passwordController,
    required this.confirmPasswordController,
    super.key,
  });

  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CustomTextfield.password(
            hint: AppStrings.passwordHint,
            label: AppStrings.passwordLabel,
            controller: passwordController,
            validator: validatePasswordForSignUp,
          ),
        ),
        10.horizontalSpace,
        Expanded(
          child: CustomTextfield.password(
            hint: AppStrings.confirmPasswordHint,
            label: AppStrings.confirmPasswordLabel,
            controller: confirmPasswordController,
            validator: (value) => validateConfirmPassword(
              value,
              password: passwordController.text,
            ),
          ),
        ),
      ],
    );
  }
}
