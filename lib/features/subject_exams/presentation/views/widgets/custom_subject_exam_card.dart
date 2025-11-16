import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_strings/app_strings.dart';
import '../../../../../core/styles/app_text_styles.dart';
import '../../../../../core/styles/assets.gen.dart';
import '../../../../../core/utils/app_sizes.dart';
import '../../../domain/entity/subject_exam_entity.dart';

class SubjectExamCard extends StatelessWidget {
  const SubjectExamCard({required SubjectExamEntity exam, super.key})
    : _entity = exam;

  final SubjectExamEntity _entity;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.h100,
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.h16,
            horizontal: AppSizes.pw24,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.r10),
                child: Assets.images.exam.image(),
              ),
              AppSizes.w8.horizontalSpace,
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      spacing: AppSizes.h4,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _entity.title ?? '',
                          style: AppTextStyles.kBlack16Regular(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '${_entity.numberOfQuestions} ${AppStrings.question}',
                          style: AppTextStyles.kGrey13Regular(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),

                    Text(
                      '${_entity.duration} ${AppStrings.minutes}',
                      style: AppTextStyles.kBlue13Regular(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
