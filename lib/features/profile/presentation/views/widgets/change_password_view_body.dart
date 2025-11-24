import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../../core/constants/app_strings/app_strings.dart';
import '../../../../../core/utils/app_sizes.dart';
import '../../../../../core/utils/validators.dart';
import '../../../../../core/widgets/custom_toast_widget.dart';
import '../../../data/models/chnage_pssword_dto/change_password_dto.dart';
import '../../view_models/profile_cubit/profile_cubit.dart';
import '../../view_models/profile_cubit/profile_events.dart';

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({super.key});

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody>
    with ShowToasts, AppValidators {
  late TextEditingController _currentPasswordController;
  late TextEditingController _newPasswordController;
  late TextEditingController _confirmPasswordController;
  late GlobalKey<FormState> _globalKey;
  bool _isButtonEnabled = true;
  bool _hasPressedButton = false;

  @override
  void initState() {
    super.initState();
    _globalKey = GlobalKey<FormState>();
    _currentPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _validateChangePasswordForm() {
    final bool isFormValid = _globalKey.currentState?.validate() ?? false;

    if (isFormValid != _isButtonEnabled) {
      setState(() {
        _isButtonEnabled = isFormValid;
      });
    }
  }

  void _submitUpdate() {
    final bool isFormValid = _globalKey.currentState?.validate() ?? false;

    setState(() {
      _hasPressedButton = true;
    });

    if (isFormValid) {
      context.read<ProfileCubit>().doIntent(
        ChangeUserPassword(
          changeUserPassword: ChangePasswordDto(
            oldPassword: _currentPasswordController.text,
            newPassword: _newPasswordController.text,
            confirmPassword: _confirmPasswordController.text,
          ),
        ),
      );
    
    } else {
      setState(() {
        _isButtonEnabled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state.changePasswordState.isLoading) {
            EasyLoading.show(status: AppStrings.loading);
          } else {
            // This is the missing piece!
            // When isLoading is false, dismiss the loader.
            EasyLoading.dismiss();
          }
          if (state.changePasswordState.hasError) {
            errorToast(
              context,
              title:
                  state.changePasswordState.errorMessage ?? 'An error occurred',
            );
          }
          if (state.changePasswordState.hasData) {
            successToast(
              context,
              title: AppStrings.passwordChangeSuccessMessage,
            );
            Navigator.of(context).pop();
          }
        },
        child: Form(
          onChanged: _hasPressedButton ? _validateChangePasswordForm : null,
          key: _globalKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.w16),
            child: Padding(
              padding: EdgeInsets.only(top: AppSizes.h16),
              child: Column(
                spacing: AppSizes.h24,
                children: [
                  TextFormField(
                    obscureText: true,
                    controller: _currentPasswordController,
                    validator: validatePassword,
                    decoration: const InputDecoration(
                      hintText: AppStrings.currentPasswordHint,
                      labelText: AppStrings.currentPasswordLabel,
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    validator: validatePasswordForSignUp,
                    controller: _newPasswordController,
                    decoration: const InputDecoration(
                      hintText: AppStrings.newPasswordHint,
                      labelText: AppStrings.newPasswordLabel,
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    validator: (value) => validateConfirmPassword(
                      value,
                      password: _newPasswordController.text,
                    ),
                    controller: _confirmPasswordController,
                    decoration: const InputDecoration(
                      hintText: AppStrings.confirmNewPasswordHint,
                      labelText: AppStrings.confirmNewPasswordLabel,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _isButtonEnabled ? _submitUpdate : null,
                    child: const Text(AppStrings.loginButton),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
