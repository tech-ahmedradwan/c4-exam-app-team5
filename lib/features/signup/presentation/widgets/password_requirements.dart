import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings/app_strings.dart';
import '../../../../core/styles/app_text_styles.dart';

class PasswordRequirements extends StatelessWidget {
  const PasswordRequirements({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(AppStrings.passwordRequirementsTitle),
          Text(
            AppStrings.passwordRequirementLength,
            style: AppTextStyles.kBlack13Regular(),
          ),
          Text(
            AppStrings.passwordRequirementUppercase,
            style: AppTextStyles.kBlack13Regular(),
          ),
          Text(
            AppStrings.passwordRequirementLowercase,
            style: AppTextStyles.kBlack13Regular(),
          ),
          Text(
            AppStrings.passwordRequirementNumber,
            style: AppTextStyles.kBlack13Regular(),
          ),
          Text(
            AppStrings.passwordRequirementSpecialCharacter,
            style: AppTextStyles.kBlack13Regular(),
          ),
        ],
      ),
    );
  }
}
