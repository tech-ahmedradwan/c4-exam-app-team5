import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/app_strings/app_strings.dart';
import '../../view_models/exam_questions/exam_result_state.dart';
import 'exam_score_body.dart';

class ExamScoreView extends StatelessWidget {
  const ExamScoreView({super.key, this.examResult});

  final ExamResultState? examResult;

  @override
  Widget build(BuildContext context) {
    final ExamResultState? result = examResult;
    // Debug logging
    if (kDebugMode) {
      log('========== ExamScoreView ==========');
      log('ExamResult received: ${result != null}');
      if (result != null) {
        log('Total Questions: ${result.totalQuestions}');
        log('Correct Answers: ${result.correctAnswers}');
        log('Incorrect Answers: ${result.incorrectAnswers}');
        log('Score Percentage: ${result.scorePercentage}%');
      }
      log('===================================');
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.examScore),
        toolbarHeight: MediaQuery.sizeOf(context).height * 0.1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ExamScoreBody(result: result),
      ),
    );
  }
}
