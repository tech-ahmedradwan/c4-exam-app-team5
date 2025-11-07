import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../../core/constants/app_routes/app_routes.dart';
import '../../../../../core/constants/app_strings/app_strings.dart';
import '../../../../../core/widgets/custom_toast_widget.dart';
import '../../view_models/forget_password/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/validators.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../view_models/forget_password/forget_password_events.dart';
import 'custom_forget_password_info_sectio.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody>
    with AppValidators, ShowToasts {
  late TextEditingController _emailController;
  late GlobalKey<FormState> _globalKey;
  bool _isButtonEnabled = false;
  @override
  void initState() {
    _emailController = TextEditingController();
    _globalKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _validateForm() {
    final bool isValid = _globalKey.currentState?.validate() ?? false;

    if (isValid != _isButtonEnabled) {
      setState(() {
        _isButtonEnabled = isValid;
      });
    }
  }

  void _submitForgetPassword() {
    context.read<ForgetPasswordCubit>().doIntety(
      ForgetPassword(_emailController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalKey,
      onChanged: _validateForm,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state.forgetPasswordState.hasError) {
              errorToast(
                context,
                title: state.forgetPasswordState.errorMessage!,
              );
            }
            if (state.forgetPasswordState.hasData) {
              successToast(context, title: AppStrings.otpSuccessToast);
              GoRouter.of(context).pushNamed(
                AppRoutes.verifyResetCodeRoute,
                extra: _emailController.text,
              );
            }
            if (state.forgetPasswordState.isLoading) {
              EasyLoading.show(status: AppStrings.loading);
            } else {
              // This is the missing piece!
              // When isLoading is false, dismiss the loader.
              EasyLoading.dismiss();
            }
          },

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CustomForgetPasswordInfoSection(
                title: AppStrings.forgetPassword,
                subTitle: AppStrings.forgetPasswordDesc,
              ),
              CustomTextfield(
                hint: AppStrings.emailHint,
                label: AppStrings.emailLabel,
                controller: _emailController,
                validator: validateEmail,
              ),
              48.verticalSpace,
              ElevatedButton(
                onPressed: _isButtonEnabled ? _submitForgetPassword : null,
                child: const Text(AppStrings.continueLabel),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
