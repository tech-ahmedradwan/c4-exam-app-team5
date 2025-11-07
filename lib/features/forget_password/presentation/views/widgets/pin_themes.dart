import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/styles/app_text_styles.dart';

mixin PinThemes {
  final PinTheme defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: AppTextStyles.kBlack18Mediam(),
    decoration: BoxDecoration(
      color: AppColors.kLightBlueColor,
      borderRadius: BorderRadius.circular(10),
    ),
  );
  final PinTheme errorPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: AppTextStyles.kBlack18Mediam(),
    decoration: BoxDecoration(
      color: Colors.transparent,
      border: Border.all(color: AppColors.kRedErrorColor),
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
