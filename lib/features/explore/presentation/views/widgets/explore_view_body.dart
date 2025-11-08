import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_models/explore_subjects/explore_subjects_cubit.dart';

class ExploreViewBody extends StatelessWidget {
  const ExploreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreSubjectsCubit, ExploreSubjectsState>(
      builder: (context, state) {
        if (state.expolreSubjectsState.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.expolreSubjectsState.errorMessage != null) {
          return Center(
            child: Text('Error: ${state.expolreSubjectsState.errorMessage}'),
          );
        } else if (state.expolreSubjectsState.data != null) {
          final subjects = state.expolreSubjectsState.data!;
          return ListView.builder(
            itemCount: subjects.length,
            itemBuilder: (context, index) {
              final subject = subjects[index];
              return ListTile(title: Text(subject.name ?? 'No Name'));
            },
          );
        } else {
          return const Center(child: Text('No subjects available.'));
        }
      },
    );
  }
}
