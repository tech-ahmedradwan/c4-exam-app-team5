import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/styles/app_text_styles.dart';

class CustomForgetPasswordInfoSection extends StatelessWidget {
  const CustomForgetPasswordInfoSection({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        40.verticalSpace,
        Center(child: Text(title, style: AppTextStyles.kBlack18Mediam())),
        16.verticalSpace,
        Center(
          child: SizedBox(
            width: 275.w,
            child: Text(
              subTitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.kGrey14Regular(),
            ),
          ),
        ),
        24.verticalSpace,
      ],
    );
  }
}
