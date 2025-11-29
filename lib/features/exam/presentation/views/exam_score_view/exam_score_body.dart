import 'package:flutter/material.dart';

import '../../../../../core/constants/app_strings/app_strings.dart';
import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/styles/app_text_styles.dart';
import '../../../../../core/utils/app_sizes.dart';
import '../../../../../core/widgets/spacers/custom_spacers_widget.dart';
import '../../view_models/exam_questions/exam_result_state.dart';
import 'body_sections/score_Indicator_and_details_section.dart';

class ExamScoreBody extends StatelessWidget {
  const ExamScoreBody({required this.result, super.key});

  final ExamResultState? result;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //------------------ Score Indicator and Details Section ------------------//
        Text(AppStrings.yourScore, style: AppTextStyles.kBlack18Medium()),
        24.spaceVertical,
        ScoreIndicatorAndDetailsSection(examResult: result),
        //------------------ Navigation to Result and Exam Screen Section ------------------//
        80.spaceVertical,
        ElevatedButton(
          onPressed: () {},
          child: const Text(AppStrings.showResults),
        ),
        24.spaceVertical,
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.r100),
              side: BorderSide(
                width: AppSizes.w2,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          child: Text(
            AppStrings.startAgain,
            style: AppTextStyles.kBlue20Medium(),
          ),
        ),
      ],
    );
  }
}
