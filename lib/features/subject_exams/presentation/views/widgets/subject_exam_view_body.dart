import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_models/subject_exam_cubit/subject_exams_cubit.dart';

class SubjectExamViewBody extends StatelessWidget {
  const SubjectExamViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubjectExamsCubit, SubjectExamsState>(
      builder: (context, state) {
        if (state.subjectExamState.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.subjectExamState.hasError) {
          return Center(
            child: Text('Error: ${state.subjectExamState.errorMessage}'),
          );
        } else if (state.subjectExamState.hasData &&
            state.subjectExamState.data!.isNotEmpty) {
          final exams = state.subjectExamState.data!;
          return ListView.builder(
            itemCount: exams.length,
            itemBuilder: (context, index) {
              final exam = exams[index];
              return ListTile(
                // ignore: prefer_single_quotes
                title: Text(exam.title ?? ""),
                subtitle: Text('Duration: ${exam.duration ?? ""}'),
              );
            },
          );
        } else {
          return const Center(child: Text('No Exams Available'));
        }
      },
    );
  }
}
