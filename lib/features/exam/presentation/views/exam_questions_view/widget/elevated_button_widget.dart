import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_sizes.dart';

class ExamElevatedButtonWidget extends StatelessWidget {
  const ExamElevatedButtonWidget({
    required this.onPressed,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.borderColor,
    super.key,
  });

  final void Function()? onPressed;
  final String text;
  final Color? borderColor;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: AppSizes.w2,
            color: borderColor ?? Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(AppSizes.r12),
        ),
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.pw12,
          vertical: AppSizes.pv16,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: AppSizes.fs16, color: textColor),
      ),
    );
  }
}
