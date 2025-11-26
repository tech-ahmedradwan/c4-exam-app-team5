import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/di/di.dart';
import '../view_models/profile_cubit/profile_cubit.dart';
import 'widgets/change_password_view_body.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Change Password')),
        body: const ChangePasswordViewBody(),
      ),
    );
  }
}
