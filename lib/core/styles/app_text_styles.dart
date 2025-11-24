import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_sizes.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();
  static TextStyle kBlack20Mediam() => GoogleFonts.inter(
    fontSize: AppSizes.fs20,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );
  static TextStyle kBlack20SemiBold() => GoogleFonts.inter(
    fontSize: AppSizes.fs20,
    fontWeight: FontWeight.w600,
    color: AppColors.blackColor,
  );
  static TextStyle kBlack18Mediam() => GoogleFonts.inter(
    fontSize: AppSizes.fs18,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );

  static TextStyle kBlack18Regular() => GoogleFonts.inter(
    fontSize: AppSizes.fs18,
    fontWeight: FontWeight.w400,
    color: AppColors.blackColor,
  );

  static TextStyle k16Medium() =>
      GoogleFonts.roboto(fontSize: AppSizes.fs16, fontWeight: FontWeight.w500);

  static TextStyle kGrey14Regular() => GoogleFonts.inter(
    fontSize: AppSizes.fs14,
    fontWeight: FontWeight.w400,
    color: AppColors.greyColor,
  );
  static TextStyle kBlack16Regular() => GoogleFonts.inter(
    fontSize: AppSizes.fs16,
    fontWeight: FontWeight.w400,
    color: AppColors.blackColor,
  );
  static TextStyle kBlack16Medium() => GoogleFonts.inter(
    fontSize: AppSizes.fs16,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );
  static TextStyle kBlack12UnderLineRegular() => GoogleFonts.inter(
    fontSize: AppSizes.fs12,
    fontWeight: FontWeight.w400,
    color: AppColors.blackColor,
    decoration: TextDecoration.underline,
  );
  static TextStyle kBlue16UnderLineRegular() => GoogleFonts.inter(
    fontSize: AppSizes.fs16,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryColor,
    decoration: TextDecoration.underline,
  );
  static TextStyle kBlue20Medium() => GoogleFonts.inter(
    fontSize: AppSizes.fs16,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
  );
  static TextStyle kBlack20Medium() => GoogleFonts.inter(
    fontSize: AppSizes.fs16,
    fontWeight: FontWeight.w500,
    color: AppColors.blackColor,
  );
  static TextStyle kPlaceHolder14Regular() => GoogleFonts.roboto(
    fontSize: AppSizes.fs14,
    fontWeight: FontWeight.normal,
    color: AppColors.placeHolderColor,
  );
  static TextStyle kBlue12SemiBold() => GoogleFonts.roboto(
    fontSize: AppSizes.fs12,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );
  static TextStyle kLightBlack12SemiBold() => GoogleFonts.roboto(
    fontSize: AppSizes.fs12,
    fontWeight: FontWeight.w600,
    color: const Color(0xff5F5F5F),
  );

  static TextStyle kBlack13Regular() => GoogleFonts.inter(
    fontSize: AppSizes.fs13,
    fontWeight: FontWeight.w400,
    color: AppColors.blackColor,
  );
  static TextStyle kBlue13Regular() => GoogleFonts.inter(
    fontSize: AppSizes.fs13,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryColor,
  );
  static TextStyle kGrey13Regular() => GoogleFonts.inter(
    fontSize: AppSizes.fs13,
    fontWeight: FontWeight.w400,
    color: AppColors.greyColor,
  );

  static TextStyle kGrey12Regular() => GoogleFonts.roboto(
    fontSize: AppSizes.fs12,
    fontWeight: FontWeight.normal,
    color: AppColors.greyColor,
  );
  static TextStyle kWhite16Medium() => GoogleFonts.roboto(
    fontSize: AppSizes.fs16,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteColor,
  );
}
