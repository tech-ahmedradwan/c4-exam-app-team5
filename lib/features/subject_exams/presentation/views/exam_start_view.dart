import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings/app_strings.dart';
import '../../../../core/styles/app_text_styles.dart';
import '../../../../core/styles/assets.gen.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../domain/entity/subject_exam_entity.dart';

class ExamStartView extends StatelessWidget {
  const ExamStartView({required this.subjectExamEntity, super.key});
  final SubjectExamEntity subjectExamEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.pw24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Assets.images.exam.image(
                  width: AppSizes.w48,
                  height: AppSizes.h48,
                ),
                AppSizes.w8.horizontalSpace,
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        subjectExamEntity.title ?? '',
                        style: AppTextStyles.kBlack20SemiBold(),
                      ),
                      Text(
                        '${subjectExamEntity.duration} ${AppStrings.minutes}',
                        style: AppTextStyles.kBlue13Regular(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AppSizes.h8.verticalSpace,
            Text(
              '${subjectExamEntity.numberOfQuestions} ${AppStrings.question}',
              style: AppTextStyles.kGrey13Regular(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            AppSizes.h48.verticalSpace,
            ElevatedButton(
              onPressed: () {
                /// Start Exam From Here
                /// Navigate to Exam Question View
              },
              child: const Text(AppStrings.start),
            ),
          ],
        ),
      ),
    );
  }
}
