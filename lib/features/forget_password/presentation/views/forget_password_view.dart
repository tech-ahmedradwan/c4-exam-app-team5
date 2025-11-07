import '../../../../config/di/di.dart';
import '../view_models/forget_password/forget_password_cubit.dart';
import 'widgets/forget_password_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_strings/app_strings.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.password)),
      body: BlocProvider<ForgetPasswordCubit>(
        create: (context) => getIt<ForgetPasswordCubit>(),
        child: const ForgetPasswordViewBody(),
      ),
    );
  }
}
