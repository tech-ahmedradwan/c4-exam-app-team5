import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import '../styles/app_text_styles.dart';

mixin ShowToasts {
  void successToast(context, {required String title, String? description}) =>
      CherryToast.success(
        title: Text(title, style: AppTextStyles.kBlack16Regular()),
      ).show(context);
  void errorToast(context, {required String title, String? description}) =>
      CherryToast.error(
        title: Text(title, style: AppTextStyles.kBlack16Regular()),
      ).show(context);

  void infoToast(context, {required String title, String? description}) =>
      CherryToast.info(
        title: Text(title, style: AppTextStyles.kBlack16Regular()),
      ).show(context);
}
