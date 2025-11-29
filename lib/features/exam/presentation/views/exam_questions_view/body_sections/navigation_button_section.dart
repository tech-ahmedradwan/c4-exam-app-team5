import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constants/app_strings/app_strings.dart';
import '../../../../../../core/styles/app_colors.dart';
import '../../../../../../core/utils/app_sizes.dart';
import '../../../view_models/exam_questions/exam_questions_cubit.dart';
import '../../../view_models/exam_questions/exam_questions_events.dart';
import '../widget/elevated_button_widget.dart';

class NavigationButtonSection extends StatelessWidget {
  const NavigationButtonSection({required this.examQuestionsCubit, super.key});

  final ExamQuestionsCubit examQuestionsCubit;

  @override
  Widget build(BuildContext context) {
    final cubit = examQuestionsCubit;
    final state = cubit.state;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Back Button
        Expanded(
          child: ExamElevatedButtonWidget(
            onPressed: state.canGoBack
                ? () => cubit.doIntent(PreviousQuestionEvent())
                : null,
            borderColor: AppColors.primaryColor,
            backgroundColor: AppColors.lightBlueColor,
            text: AppStrings.back,
            textColor: AppColors.primaryColor,
          ),
        ),
        AppSizes.w16.horizontalSpace,
        // Next Button
        Expanded(
          child: ExamElevatedButtonWidget(
            onPressed: state.canGoNext
                ? () => cubit.doIntent(NextQuestionEvent())
                : () => cubit.doIntent(ExamScoreEvent()),
            backgroundColor: AppColors.primaryColor,
            text: state.canGoNext ? AppStrings.next : AppStrings.finish,
            textColor: AppColors.backgroundColor,
          ),
        ),
      ],
    );
  }
}
