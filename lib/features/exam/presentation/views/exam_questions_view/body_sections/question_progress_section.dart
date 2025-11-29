import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constants/app_strings/app_strings.dart';
import '../../../../../../core/styles/app_colors.dart';
import '../../../../../../core/styles/app_text_styles.dart';
import '../../../../../../core/utils/app_sizes.dart';
import '../../../view_models/exam_questions/exam_questions_cubit.dart';

class QuestionProgressSection extends StatelessWidget {
  const QuestionProgressSection({required this.examQuestionsCubit, super.key});

  final ExamQuestionsCubit examQuestionsCubit;

  @override
  Widget build(BuildContext context) {
    final cubit = examQuestionsCubit;
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            '${AppStrings.question} ${cubit.state.currentQuestionNumber} of ${cubit.state.totalQuestions}',
            style: AppTextStyles.kGrey14Regular().copyWith(
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        AppSizes.h8.verticalSpace,
        LinearProgressIndicator(
          color: AppColors.primaryColor,
          backgroundColor: AppColors.lightBlueColor,
          borderRadius: BorderRadius.circular(AppSizes.r100),
          value: cubit.state.progressValue,
        ),
        AppSizes.h24.verticalSpace,
      ],
    );
  }
}
