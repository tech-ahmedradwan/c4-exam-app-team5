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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.error_outline, color: Colors.red, size: 48),
                const SizedBox(height: 16),
                const Text(
                  'Something went wrong. Please try again.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                if (state.subjectExamState.errorMessage != null &&
                    state.subjectExamState.errorMessage!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text(
                      'Details: ${state.subjectExamState.errorMessage}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
              ],
            ),
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
