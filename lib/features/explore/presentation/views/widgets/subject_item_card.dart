import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/styles/app_text_styles.dart';
import '../../../../../core/utils/app_sizes.dart';
import '../../../../../core/widgets/custom_loading_widget.dart';
import '../../../domain/entity/explore_subject_entity.dart';

class SubjectItemCard extends StatelessWidget {
  const SubjectItemCard({required ExploreSubjectEntity subject, super.key})
    : _subject = subject;

  final ExploreSubjectEntity _subject;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.h80,
      child: Card(
        child: Container(
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppSizes.w24.horizontalSpace,
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.r10),
                child: CachedNetworkImage(
                  placeholder: (context, url) => const CustomLoadingWidget(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  width: AppSizes.w48,
                  height: AppSizes.h48,
                  memCacheWidth: AppSizes.w48.toInt(),
                  memCacheHeight: AppSizes.h48.toInt(),
                  imageUrl: _subject.icon!,
                ),
              ),
              AppSizes.w8.horizontalSpace,
              Text(
                _subject.name ?? '',
                style: AppTextStyles.kBlack16Regular(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
