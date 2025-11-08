import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/di/di.dart';
import '../view_models/explore_subjects/explore_subjects_cubit.dart';
import '../view_models/explore_subjects/explore_subjects_event.dart';
import 'widgets/explore_view_body.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ExploreSubjectsCubit>()..doIntent(FetchExploreSubjects()),
      child: const ExploreViewBody(),
    );
  }
}
