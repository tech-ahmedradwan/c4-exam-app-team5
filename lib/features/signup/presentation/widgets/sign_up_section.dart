import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_strings/app_strings.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../../../core/widgets/custom_snack_bar.dart';
import '../../domain/entities/user_entity.dart';
import '../view_models/sign_up_cubit.dart';
import '../view_models/sign_up_events.dart';
import 'sign_up_fields.dart';

class SignUpSection extends StatefulWidget {
  const SignUpSection({super.key});

  @override
  State<SignUpSection> createState() => _SignUpSectionState();
}

class _SignUpSectionState extends State<SignUpSection> {
  final GlobalKey<FormState> _signupFormKey = GlobalKey();

  late final TextEditingController _usernameController;
  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  late final TextEditingController _phoneNumberController;

  bool _isButtonEnabled = true;
  bool _hasPressedButton = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _signupFormKey,
      onChanged: _hasPressedButton ? _validateSignUpForm : null,
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {
          if (state.signupState.hasData) {
            context.pop();
            customSnackBar(context, message: AppStrings.signUpSuccess);
          } else if (state.signupState.hasError) {
            customSnackBar(context, message: state.signupState.errorMessage!);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              AbsorbPointer(
                absorbing: state.signupState.isLoading,
                child: SignUpFields(
                  usernameController: _usernameController,
                  firstNameController: _firstNameController,
                  lastNameController: _lastNameController,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  confirmPasswordController: _confirmPasswordController,
                  phoneNumberController: _phoneNumberController,
                ),
              ),
              42.verticalSpace,
              state.signupState.isLoading
                  ? const CustomLoadingWidget()
                  : ElevatedButton(
                      onPressed: _isButtonEnabled ? _submitSignUp : null,
                      child: const Text(AppStrings.loginButton),
                    ),
            ],
          );
        },
      ),
    );
  }

  void _validateSignUpForm() {
    final bool isFormValid = _signupFormKey.currentState?.validate() ?? false;

    if (isFormValid != _isButtonEnabled) {
      setState(() {
        _isButtonEnabled = isFormValid;
      });
    }
  }

  void _submitSignUp() {
    final bool isFormValid = _signupFormKey.currentState?.validate() ?? false;

    setState(() {
      _hasPressedButton = true;
    });

    if (isFormValid) {
      context.read<SignUpCubit>().doIntent(
        SignUp(
          user: UserEntity.fromMap({
            'username': _usernameController.text,
            'firstName': _firstNameController.text,
            'lastName': _lastNameController.text,
            'email': _emailController.text,
            'password': _passwordController.text,
            'rePassword': _passwordController.text,
            'phone': _phoneNumberController.text,
          }),
        ),
      );
    } else {
      setState(() {
        _isButtonEnabled = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }
}
