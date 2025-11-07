import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../../core/constants/app_routes/app_routes.dart';
import '../../../../../core/constants/app_strings/app_strings.dart';
import '../../../../../core/utils/validators.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/custom_toast_widget.dart';
import '../../view_models/reset_password/reset_password_cubit.dart';
import '../../view_models/reset_password/reset_password_event.dart';
import 'custom_forget_password_info_sectio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({required this.email, super.key});
  final String email;
  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody>
    with AppValidators, ShowToasts {
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late GlobalKey<FormState> _key;
  bool _isButtonEnabled = false;
  @override
  void initState() {
    _key = GlobalKey<FormState>();
    _confirmPasswordController = TextEditingController();
    _passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _confirmPasswordController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validateForm() {
    final bool isValid = _key.currentState?.validate() ?? false;

    if (isValid != _isButtonEnabled) {
      setState(() {
        _isButtonEnabled = isValid;
      });
    }
  }

  void _submitResetPassword() {
    context.read<ResetPasswordCubit>().doIntent(
      ResetPasswordEvent(
        email: widget.email,
        newPassword: _passwordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Form(
        onChanged: _validateForm,
        key: _key,
        child: BlocListener<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) {
            if (state.resetPasswordState.hasData) {
              successToast(
                context,
                title: AppStrings.resetPasswordSuccessToast,
              );
              context.goNamed(AppRoutes.signInRoute);
            }
            if (state.resetPasswordState.isLoading) {
              EasyLoading.show(status: AppStrings.loading);
            } else {
              EasyLoading.dismiss();
            }
            if (state.resetPasswordState.hasError) {
              errorToast(
                context,
                title: state.resetPasswordState.errorMessage!,
              );
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CustomForgetPasswordInfoSection(
                title: AppStrings.resetPassword,
                subTitle: AppStrings.resetPasswordDesc,
              ),
              CustomTextfield.password(
                hint: AppStrings.passwordHint,
                label: AppStrings.passwordLabel,
                controller: _passwordController,
                validator: validatePassword,
              ),
              24.verticalSpace,
              CustomTextfield.password(
                hint: AppStrings.confirmPasswordHint,
                label: AppStrings.confirmPasswordLabel,
                controller: _confirmPasswordController,
                validator: (value) => validateConfirmPassword(
                  _passwordController.text,
                  password: _confirmPasswordController.text,
                ),
              ),
              48.verticalSpace,

              ElevatedButton(
                onPressed: _isButtonEnabled ? _submitResetPassword : null,
                child: const Text(AppStrings.continueLabel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
