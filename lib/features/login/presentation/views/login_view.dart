import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/di/di.dart';
import '../../../../core/constants/app_strings/app_strings.dart';
import '../view_models/cubit/login_cubit.dart';
import 'widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.loginTitle)),
      body: BlocProvider<LoginCubit>(
        create: (context) => getIt<LoginCubit>(),
        child: const LoginViewBody(),
      ),
    );
  }
}
