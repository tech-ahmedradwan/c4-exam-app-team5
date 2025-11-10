import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../styles/app_text_styles.dart';
import '../utils/app_sizes.dart';

class AppThemes {
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      titleTextStyle: AppTextStyles.kBlack20Mediam(),
      centerTitle: false,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    splashFactory: NoSplash.splashFactory,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    cardTheme: CardThemeData(
      elevation: AppSizes.w4, // Controls the size and intensity of the shadow
      // Sets the color of the shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSizes.r10,
        ), // Optional: for rounded corners
      ),

      color: AppColors.whiteColor,
      shadowColor: AppColors.shadowColor.withValues(alpha: 0.25),
    ),
    inputDecorationTheme: InputDecorationThemeData(
      hintStyle: AppTextStyles.kPlaceHolder14Regular(),
      labelStyle: AppTextStyles.kGrey12Regular(),

      contentPadding: EdgeInsets.symmetric(
        horizontal: AppSizes.h14,
        vertical: AppSizes.p14,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.r4),
        borderSide: BorderSide(
          color: AppColors.borderColor,
          width: AppSizes.w1_5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.r4),
        borderSide: BorderSide(
          color: AppColors.borderColor,
          width: AppSizes.w1_5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.r4),
        borderSide: BorderSide(
          color: AppColors.errorBorderColor,
          width: AppSizes.w1_5,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.r4),
        borderSide: BorderSide(
          color: AppColors.errorBorderColor,
          width: AppSizes.w1_5,
        ),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.r64),
        ),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        textStyle: AppTextStyles.kWhite16Medium(),
        minimumSize: Size.fromHeight(AppSizes.h48),
      ),
    ),
  );

  static ThemeData dark = ThemeData(brightness: Brightness.dark);
}
