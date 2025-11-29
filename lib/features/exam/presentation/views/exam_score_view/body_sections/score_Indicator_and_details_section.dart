import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/constants/app_strings/app_strings.dart';
import '../../../../../../core/styles/app_colors.dart';
import '../../../../../../core/styles/app_text_styles.dart';
import '../../../../../../core/utils/app_sizes.dart';
import '../../../../../../core/widgets/spacers/custom_spacers_widget.dart';
import '../../../view_models/exam_questions/exam_result_state.dart';

class ScoreIndicatorAndDetailsSection extends StatelessWidget {
  const ScoreIndicatorAndDetailsSection({required this.examResult, super.key});

  final ExamResultState? examResult;

  @override
  Widget build(BuildContext context) {
    final double scoreValue = examResult != null
        ? examResult!.scorePercentage / 100
        : 0.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _ScoreCircularIndicator(score: scoreValue),
        _ScoreDetails(examResult: examResult),
      ],
    );
  }
}

class _ScoreCircularIndicator extends StatelessWidget {
  const _ScoreCircularIndicator({required this.score});

  final double score;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 132.r,
    height: 132.r,
    child: Stack(
      fit: StackFit.expand,
      children: [
        CircularProgressIndicator(
          value: score,
          strokeWidth: 12,
          backgroundColor: AppColors.redErrorColor,
          valueColor: const AlwaysStoppedAnimation<Color>(
            AppColors.primaryColor,
          ),
        ),
        Center(
          child: Text(
            '${(score * 100).toInt()}%',
            style: AppTextStyles.kBlack20Medium(),
          ),
        ),
      ],
    ),
  );
}

class _ScoreDetails extends StatelessWidget {
  const _ScoreDetails({required this.examResult});

  final ExamResultState? examResult;

  @override
  Widget build(BuildContext context) {
    final int correctCount = examResult?.correctAnswers ?? 0;
    final int incorrectCount = examResult?.incorrectAnswers ?? 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow(
          color: AppColors.primaryColor,
          label: AppStrings.correct,
          count: correctCount,
        ),
        8.spaceVertical,
        _buildDetailRow(
          color: AppColors.redErrorColor,
          label: AppStrings.incorrect,
          count: incorrectCount,
        ),
      ],
    );
  }

  Widget _buildDetailRow({
    required Color color,
    required String label,
    required int count,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //------------------ Label Name ------------------//
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppTextStyles.kBlack16Medium().copyWith(color: color),
            ),
          ],
        ),
        //------------------ Count Value ------------------//
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color, width: AppSizes.w2),
          ),
          child: Text(
            count.toString(),
            style: AppTextStyles.kGrey14Regular().copyWith(
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
