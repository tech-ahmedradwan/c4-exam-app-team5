import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/di/di.dart';
import '../../../../core/constants/app_routes/app_routes.dart';
import '../../../../core/constants/app_strings/app_strings.dart';
import '../../../../core/styles/app_colors.dart';
import '../../../../core/styles/app_text_styles.dart';
import '../view_models/sign_up_cubit.dart';
import '../widgets/sign_up_section.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.signUpTitle)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              6.verticalSpace,
              BlocProvider(
                create: (context) => getIt<SignUpCubit>(),
                child: const SignUpSection(),
              ),
              6.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.alreadyHaveAccount,
                    style: AppTextStyles.kBlack16Regular(),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(0, 0),
                    ),
                    onPressed: () {
                      context.go(AppRoutes.signInRoute);
                    },
                    child: Text(
                      AppStrings.loginButton,
                      style: AppTextStyles.kBlack12UnderLineRegular().copyWith(
                        fontSize: 16.sp,
                        color: AppColors.kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              // const PasswordRequirements(),
            ],
          ),
        ),
      ),
    );
  }
}
