import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_routes/app_routes.dart';
import '../../../core/constants/app_strings/app_strings.dart';
import '../../../features/forget_password/presentation/views/forget_password_view.dart';
import '../../../features/forget_password/presentation/views/reset_password_view.dart';
import '../../../features/forget_password/presentation/views/verify_reset_code_view.dart';
import '../../../features/home_layout/presentation/views/home_layout_view.dart';
import '../../../features/login/presentation/views/login_view.dart';
import '../../../features/signup/presentation/views/sign_up_view.dart';

class AppRouter {
  static GoRouter initialize({String? initialRoute}) {
    return GoRouter(
      initialLocation: initialRoute ?? AppRoutes.signInRoute,
      errorBuilder: (context, state) =>
          const Scaffold(body: Center(child: Text(AppStrings.errorNavigate))),
      routes: [
        GoRoute(
          path: AppRoutes.signInRoute,
          name: AppRoutes.signInRoute,
          builder: (context, state) => const LoginView(),
        ),
        GoRoute(
          path: AppRoutes.signUpRoute,
          name: AppRoutes.signUpRoute,
          builder: (context, state) => const SignUpView(),
        ),
        GoRoute(
          path: AppRoutes.homeRoute,
          name: AppRoutes.homeRoute,
          builder: (context, state) => const HomeLayoutView(),
        ),
        GoRoute(
          path: AppRoutes.forgetPasswordRoute,
          name: AppRoutes.forgetPasswordRoute,
          builder: (context, state) => const ForgetPasswordView(),
        ),
        GoRoute(
          path: AppRoutes.verifyResetCodeRoute,
          name: AppRoutes.verifyResetCodeRoute,

          builder: (context, state) {
            final String email = state.extra as String;
            return VerifyResetCodeView(email: email);
          },
        ),
        GoRoute(
          path: AppRoutes.resetPasswordRoute,
          name: AppRoutes.resetPasswordRoute,
          builder: (context, state) {
            final String email = state.extra as String;
            return ResetPasswordView(email: email);
          },
        ),
      ],
    );
  }
}
