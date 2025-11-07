import '../../../../config/di/di.dart';
import '../../../../core/constants/app_strings/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_models/verify_reset_code/verify_rest_code_cubit.dart';
import 'widgets/verify_reset_code_view_body.dart';

class VerifyResetCodeView extends StatelessWidget {
  const VerifyResetCodeView({required this.email, super.key});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.password)),
      body: BlocProvider<VerifyRestCodeCubit>(
        create: (context) => getIt<VerifyRestCodeCubit>(),
        child: VerifyResetCodeViewBody(email: email),
      ),
    );
  }
}
