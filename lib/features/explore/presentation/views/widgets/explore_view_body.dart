import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_strings/app_strings.dart';
import '../../../../../core/styles/app_text_styles.dart';
import '../../../../../core/utils/app_sizes.dart';
import '../../../../../core/widgets/custom_loading_widget.dart';
import '../../view_models/explore_subjects/explore_subjects_cubit.dart';
import '../../view_models/explore_subjects/explore_subjects_event.dart';
import 'custom_search_textfield.dart';
import 'subject_item_card.dart';

class ExploreViewBody extends StatelessWidget {
  const ExploreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.pw16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextfield(
            onChanged: (value) {
              context.read<ExploreSubjectsCubit>().doIntent(
                SearchInSubjects(value: value),
              );
            },
          ),
          AppSizes.h40.verticalSpace,
          Text(
            AppStrings.browseBySubject,
            style: AppTextStyles.kBlack18Mediam(),
          ),
          AppSizes.h24.verticalSpace,
          Expanded(
            child: BlocBuilder<ExploreSubjectsCubit, ExploreSubjectsState>(
              // buildWhen: (previous, current) {
              //   return previous.expolreSubjectsState.data !=
              //       current.expolreSubjectsState.data;
              // },
              builder: (context, state) {
                if (state.expolreSubjectsState.isLoading) {
                  return const CustomLoadingWidget();
                } else if (state.expolreSubjectsState.errorMessage != null) {
                  return Center(
                    child: Text(
                      'Error: ${state.expolreSubjectsState.errorMessage}',
                    ),
                  );
                } else if (state.expolreSubjectsState.data != null) {
                  final subjects = state.expolreSubjectsState.data!;
                  return ListView.separated(
                    itemCount: subjects.length,
                    itemBuilder: (context, index) =>
                        SubjectItemCard(subject: subjects[index]),
                    separatorBuilder: (context, index) =>
                        AppSizes.h8.verticalSpace,
                  );
                } else {
                  return const Center(child: Text('No subjects available.'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
