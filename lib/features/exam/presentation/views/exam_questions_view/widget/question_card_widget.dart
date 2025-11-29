import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_sizes.dart';

class QuestionCardWidget extends StatelessWidget {
  const QuestionCardWidget({
    required this.child,
    required this.backgroundColor,
    super.key,
  });

  final Widget child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.r10),
      ),
      elevation: 0,
      color: backgroundColor,
      child: child,
    );
  }
}
