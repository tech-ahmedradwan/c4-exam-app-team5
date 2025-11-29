import 'package:flutter/material.dart';

import '../../../../../../core/styles/app_colors.dart';
import '../../../../../../core/styles/app_text_styles.dart';
import '../../../../domain/entity/answer_entity.dart';
import '../../../view_models/exam_questions/exam_questions_cubit.dart';
import '../../../view_models/exam_questions/exam_questions_events.dart';
import '../widget/question_card_widget.dart';

class AnswerSection extends StatelessWidget {
  const AnswerSection({required this.examQuestionsCubit, super.key});

  final ExamQuestionsCubit examQuestionsCubit;

  @override
  Widget build(BuildContext context) {
    final cubit = examQuestionsCubit;
    final currentQuestion = cubit.state.currentQuestion!;
    return Expanded(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: currentQuestion.answers?.length ?? 0,
        itemBuilder: (context, index) {
          final answerEntity = currentQuestion.answers![index];
          return QuestionCardWidget(
            backgroundColor: cubit.state.selectedAnswerIndex == index
                ? AppColors.blueColor
                : AppColors.lightBlueColor,
            child: _customRadioGroupListTile(cubit, index, answerEntity),
          );
        },
      ),
    );
  }

  Widget _customRadioGroupListTile(
    ExamQuestionsCubit cubit,
    int index,
    AnswerEntity answerEntity,
  ) => RadioGroup(
    onChanged: (value) {
      if (value != null) {
        cubit.doIntent(SelectAnswerEvent(answerIndex: value));
      }
    },
    groupValue: cubit.state.selectedAnswerIndex,
    child: RadioListTile(
      title: Text(
        answerEntity.answer ?? '',
        style: AppTextStyles.kGrey14Regular().copyWith(
          color: AppColors.blackColor,
        ),
      ),
      value: index,
    ),
    );
}
