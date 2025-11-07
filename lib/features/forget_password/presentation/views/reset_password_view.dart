import '../../../../config/di/di.dart';
import '../view_models/reset_password/reset_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_strings/app_strings.dart';
import 'widgets/reset_password_view_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({required this.email, super.key});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.password)),
      body: BlocProvider<ResetPasswordCubit>(
        create: (context) => getIt<ResetPasswordCubit>(),
        child: ResetPasswordViewBody(email: email),
      ),
    );
  }
}
