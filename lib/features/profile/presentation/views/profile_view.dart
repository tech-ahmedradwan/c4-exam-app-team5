import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/di/di.dart';
import '../view_models/profile_cubit/profile_cubit.dart';
import '../view_models/profile_cubit/profile_events.dart';
import 'widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<ProfileCubit>()..doIntent(LoadUserProfile()),
        child: const ProfileViewBody(),
      ),
    );
  }
}
