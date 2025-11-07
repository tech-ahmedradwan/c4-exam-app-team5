import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/di/di.dart';
import '../../../../../core/constants/app_strings/app_strings.dart';
import '../../../../../core/constants/cache_keys/app_cache_keys.dart';
import '../../../../../core/services/local/app_storage/app_storage.dart';
import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/styles/app_text_styles.dart';

class CustomRememberAndForget extends StatefulWidget {
  const CustomRememberAndForget({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  State<CustomRememberAndForget> createState() =>
      _CustomRememberAndForgetState();
}

class _CustomRememberAndForgetState extends State<CustomRememberAndForget> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 0,
      isThreeLine: false,
      contentPadding: EdgeInsets.zero,
      leading: Checkbox(
        activeColor: AppColors.primaryColor,
        value: isSelected,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(2.r),
        ),
        side: BorderSide(color: AppColors.greyColor, width: 2.w),
        onChanged: (value) async {
          setState(() {
            isSelected = !isSelected;
          });
          await getIt<AppStorage>().saveBool(
            AppCacheKeys.rememberMeKey,
            isSelected,
          );
        },
      ),
      title: Text(
        AppStrings.rememberMe,
        style: AppTextStyles.kBlack13Regular(),
      ),
      trailing: TextButton(
        onPressed: widget.onPressed,
        child: Text(
          AppStrings.forgetPassword,
          style: AppTextStyles.kBlack12UnderLineRegular(),
        ),
      ),
    );
  }
}
