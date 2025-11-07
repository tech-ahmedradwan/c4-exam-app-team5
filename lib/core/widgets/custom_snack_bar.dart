import 'package:flutter/material.dart';

import '../styles/app_text_styles.dart';

void customSnackBar(BuildContext context, {required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: AppTextStyles.kBlack18Regular().copyWith(color: Colors.white),
      ),
      duration: const Duration(milliseconds: 1500),
    ),
  );
}
