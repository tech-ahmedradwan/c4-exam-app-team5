import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_routes/app_routes.dart';
import '../../../../../core/constants/app_strings/app_strings.dart';
import '../../../../../core/styles/app_colors.dart';
import '../../../../../core/styles/app_text_styles.dart';
import '../../../../../core/styles/assets.gen.dart';
import '../../../../../core/utils/app_sizes.dart';
import '../../view_models/exam_questions/exam_questions_cubit.dart';
import '../../view_models/exam_questions/exam_questions_events.dart';
import '../../view_models/exam_questions/exam_questions_state.dart';
import 'body_sections/answer_section.dart';
import 'body_sections/navigation_button_section.dart';
import 'body_sections/question_progress_section.dart';
import 'widget/timeout_dialog_widget.dart';

class ExamQuestionsBody extends StatelessWidget {
  const ExamQuestionsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExamQuestionsCubit>();
    return BlocConsumer<ExamQuestionsCubit, ExamQuestionsState>(
      listenWhen: (previous, current) {
        // Listen when showTimeoutDialog changes from false to true
        // OR when navigateTo changes to a non-none value
        final shouldListenDialog =
            !previous.showTimeoutDialog && current.showTimeoutDialog;
        final shouldListenNavigation =
            previous.navigateTo == NavigationAction.none &&
            current.navigateTo != NavigationAction.none;
        return shouldListenDialog || shouldListenNavigation;
      },
      listener: (context, state) {
        // Navigate to score screen
        if (state.navigateTo == NavigationAction.scoreScreen) {
          context.pushNamed(
            AppRoutes.examScoreRoute,
            extra: state.examResultState,
          );
          // Reset navigation state after handling
          cubit.resetNavigation();
        }
        // Show timeout dialog when showTimeoutDialog is true
        if (state.showTimeoutDialog) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (dialogContext) => TimeoutDialogWidget(
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Close dialog
                cubit.doIntent(ShowTimeoutDialogEvent()); // Reset flag
                cubit.doIntent(ExamScoreEvent()); // Navigate to score
              },
            ),
          );
        }
      },
      builder: (context, state) {
        // Show loading indicator
        if (state.questionState.isLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        // Show error message
        if (state.questionState.hasError) {
          return Scaffold(
            body: Center(
              child: Text(
                state.questionState.errorMessage ?? 'An error occurred',
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        }
        // Show message if no data
        if (!state.questionState.hasData || state.currentQuestion == null) {
          return const Scaffold(
            body: Center(child: Text(AppStrings.noQuestionsAvailable)),
          );
        }

        final currentQuestion = state.currentQuestion!;

        // Format remaining time as MM:SS
        String formatTime(int totalSeconds) {
          final minutes = totalSeconds ~/ 60;
          final seconds = totalSeconds % 60;
          return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
        }

        // Calculate the half of the exam duration in seconds
        final halfExamDuration = (state.examDuration * 60) / 2;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              '${currentQuestion.exam?.title}',
              style: AppTextStyles.kBlack20Mediam(),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              Assets.images.clock.image(),
              // 8.spaceVertical,
              AppSizes.w8.horizontalSpace,
              Text(
                formatTime(state.timerState.remainingSeconds),
                style: AppTextStyles.kBlack20Mediam().copyWith(
                  color: state.timerState.remainingSeconds < halfExamDuration
                      ? AppColors.redErrorColor
                      : Colors.green,
                ),
              ),
              AppSizes.w16.horizontalSpace,
            ],
            toolbarHeight: MediaQuery.sizeOf(context).height * 0.1,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //------------------ Question Progress Section ------------------//
                QuestionProgressSection(examQuestionsCubit: cubit),
                //------------------ Question Content Section ------------------//
                Text(
                  currentQuestion.question ?? '',
                  style: AppTextStyles.kBlack16Medium(),
                ),
                AppSizes.h16.verticalSpace,
                //------------------ Answers Section ------------------//
                AnswerSection(examQuestionsCubit: cubit),
                //------------------ Navigation Buttons Section ------------------//
                NavigationButtonSection(examQuestionsCubit: cubit),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
