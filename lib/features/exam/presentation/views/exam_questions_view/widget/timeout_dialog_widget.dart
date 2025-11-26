import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_strings/app_strings.dart';
import '../../../../../../core/styles/app_text_styles.dart';
import '../../../../../../core/styles/assets.gen.dart';
import '../../../../../../core/utils/app_sizes.dart';

class TimeoutDialogWidget extends StatelessWidget {
  const TimeoutDialogWidget({required this.onPressed, super.key});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.r16),
      ),
      actionsAlignment: MainAxisAlignment.center,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.images.sandClock.image(),
          Text(AppStrings.timeout, style: AppTextStyles.kRed24Regular()),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: onPressed,
          child: const Text(AppStrings.viewScore),
        ),
      ],
    );
  }
}
