import '../../../../../core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({required this.navItems, super.key});
  final List<Widget> navItems;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      decoration: const BoxDecoration(color: AppColors.kLightBlueColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        spacing: 8.w,
        children: navItems,
      ),
    );
  }
}
