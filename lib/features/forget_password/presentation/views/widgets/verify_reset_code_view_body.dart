import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../../../../core/constants/app_routes/app_routes.dart';
import '../../../../../core/constants/app_strings/app_strings.dart';
import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/styles/app_text_styles.dart';
import '../../../../../core/widgets/custom_fixed_clickable_text_widget.dart';
import '../../../../../core/widgets/custom_toast_widget.dart';
import '../../view_models/verify_reset_code/verify_reset_code_event.dart';
import '../../view_models/verify_reset_code/verify_rest_code_cubit.dart';
import 'custom_forget_password_info_sectio.dart';
import 'pin_themes.dart';

class VerifyResetCodeViewBody extends StatefulWidget {
  const VerifyResetCodeViewBody({required this.email, super.key});
  final String email;
  @override
  State<VerifyResetCodeViewBody> createState() =>
      _VerifyResetCodeViewBodyState();
}

class _VerifyResetCodeViewBodyState extends State<VerifyResetCodeViewBody>
    with PinThemes, ShowToasts {
  late TextEditingController _codeController;
  @override
  void initState() {
    _codeController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        children: [
          const CustomForgetPasswordInfoSection(
            title: AppStrings.emailVerification,
            subTitle: AppStrings.emailVerificationDesc,
          ),
          BlocConsumer<VerifyRestCodeCubit, VerifyRestCodeState>(
            builder: (context, state) {
              return Pinput(
                forceErrorState: state.verifyResetState.hasError,
                length: 6,
                controller: _codeController,
                onCompleted: (value) {
                  context.read<VerifyRestCodeCubit>().doIntent(
                    VerifyResetCode(code: _codeController.text),
                  );
                },
                errorPinTheme: errorPinTheme,
                errorBuilder: (errorText, pin) => Padding(
                  padding: EdgeInsets.only(top: 8.0.h),
                  child: Row(
                    children: [
                      Text(
                        AppStrings.invalidCode,
                        style: AppTextStyles.kBlack13Regular().copyWith(
                          color: AppColors.kRedErrorColor,
                        ),
                      ),
                      4.verticalSpace,
                      const Icon(
                        Icons.info_outlined,
                        color: AppColors.kRedErrorColor,
                      ),
                    ],
                  ),
                ),
                errorText: AppStrings.invalidCode,
                defaultPinTheme: defaultPinTheme,
              );
            },
            listener: (context, state) {
              if (state.verifyResetState.hasData) {
                successToast(
                  context,
                  title: AppStrings.codeVerifiedSuccessToast,
                );
                context.goNamed(
                  AppRoutes.resetPasswordRoute,
                  extra: widget.email,
                );
              }
              if (state.verifyResetState.hasError) {
                errorToast(
                  context,
                  title: state.verifyResetState.errorMessage!,
                );
              }
              if (state.verifyResetState.isLoading) {
                EasyLoading.show(status: AppStrings.loading);
              } else {
                EasyLoading.dismiss();
              }
            },
          ),
          24.verticalSpace,
          Center(
            child: CustomFixedTextAndClickableText(
              fixedText: AppStrings.didntReceiveCode,
              clickableText: AppStrings.resent,
              onTap: () {
                context.read<VerifyRestCodeCubit>().doIntent(
                  ResentCode(email: widget.email),
                );
                _codeController.clear();
              },
            ),
          ),
        ],
      ),
    );
  }
}
