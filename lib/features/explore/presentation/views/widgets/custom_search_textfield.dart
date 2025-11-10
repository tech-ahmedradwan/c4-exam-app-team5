import 'package:flutter/material.dart';

import '../../../../../core/constants/app_strings/app_strings.dart';
import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/styles/app_text_styles.dart';
import '../../../../../core/utils/app_sizes.dart';

class CustomSearchTextfield extends StatelessWidget {
  const CustomSearchTextfield({super.key, this.onChanged});
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      autocorrect: false,
      decoration: InputDecoration(
        isDense: true,
        hintText: AppStrings.search,
        hintStyle: AppTextStyles.kGrey14Regular().copyWith(
          color: AppColors.lightGrayColor,
          fontWeight: FontWeight.w500,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSizes.w4,
          vertical: AppSizes.h16,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.lightGrayColor,
          size: AppSizes.fs24,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.r20),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.r20),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSizes.r20),
        ),
      ),
    );
  }
}
