import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../styles/app_text_styles.dart';

class CustomFixedTextAndClickableText extends StatelessWidget {
  const CustomFixedTextAndClickableText({
    required this.fixedText,
    required this.clickableText,
    required this.onTap,
    super.key,
  });
  final String fixedText;
  final String clickableText;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: fixedText, style: AppTextStyles.kBlack16Regular()),
          TextSpan(
            text: clickableText,
            style: AppTextStyles.kBlack12UnderLineRegular().copyWith(
              color: AppColors.kPrimaryColor,
              fontSize: 16,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
