import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavBarItem extends StatelessWidget {
  const CustomBottomNavBarItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    super.key,
  });
  final Widget icon;
  final String label;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 4.h,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 7.h),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.sp),
            color: isSelected ? AppColors.kBlueColor : Colors.transparent,
          ),
          child: icon,
        ),
        Text(label, style: AppTextStyles.kBlue12SemiBold()),
      ],
    );
  }
}
