import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/di/di.dart';
import '../../view_models/exam_questions/exam_questions_cubit.dart';
import '../../view_models/exam_questions/exam_questions_events.dart';
import 'exam_questions_body.dart';

class ExamQuestionsView extends StatelessWidget {
  const ExamQuestionsView({required this.examId, super.key});

  final String examId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            getIt<ExamQuestionsCubit>()
              ..doIntent(GetExamQuestionsDataEvent(examId: examId)),
        child: const ExamQuestionsBody(),
      ),
    );
  }
}
