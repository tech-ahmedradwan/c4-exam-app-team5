import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/di/di.dart';
import '../../../../core/constants/app_routes/app_routes.dart';
import '../../../../core/constants/app_strings/app_strings.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/widgets/custom_fixed_clickable_text_widget.dart';
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
        padding: EdgeInsets.symmetric(horizontal: AppSizes.w16),
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
              Center(
                child: CustomFixedTextAndClickableText(
                  fixedText: AppStrings.dontHaveAccount,
                  clickableText: AppStrings.loginButton,
                  onTap: () {
                    context.pushNamed(AppRoutes.signInRoute);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
