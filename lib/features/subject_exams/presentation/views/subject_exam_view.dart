import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/di/di.dart';
import '../view_models/subject_exam_cubit/subject_exam_event.dart';
import '../view_models/subject_exam_cubit/subject_exams_cubit.dart';
import 'widgets/subject_exam_view_body.dart';

class SubjectExamView extends StatelessWidget {
  const SubjectExamView({required this.subjectId, super.key});
  final String subjectId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Subject Exams')),
      body: BlocProvider(
        create: (context) =>
            getIt<SubjectExamsCubit>()
              ..doIntent(GetSubjectExams(subjectId: '')),
        child: const SubjectExamViewBody(),
      ),
    );
  }
}
