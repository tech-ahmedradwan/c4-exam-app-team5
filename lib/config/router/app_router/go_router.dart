import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_routes/app_routes.dart';
import '../../../core/constants/app_strings/app_strings.dart';
import '../../../features/exam/presentation/view_models/exam_questions/exam_result_state.dart';
import '../../../features/exam/presentation/views/exam_questions_view/exam_questions_view.dart';
import '../../../features/exam/presentation/views/exam_score_view/exam_score_view.dart';
import '../../../features/explore/domain/entity/explore_subject_entity.dart';
import '../../../features/forget_password/presentation/views/forget_password_view.dart';
import '../../../features/forget_password/presentation/views/reset_password_view.dart';
import '../../../features/forget_password/presentation/views/verify_reset_code_view.dart';
import '../../../features/home_layout/presentation/views/home_layout_view.dart';
import '../../../features/login/presentation/views/login_view.dart';
import '../../../features/signup/presentation/views/sign_up_view.dart';
import '../../../features/subject_exams/domain/entity/subject_exam_entity.dart';
import '../../../features/subject_exams/presentation/views/exam_start_view.dart';
import '../../../features/subject_exams/presentation/views/subject_exam_view.dart';

class AppRouter {
  static GoRouter initialize({String? initialRoute}) {
    return GoRouter(
      initialLocation: initialRoute ?? AppRoutes.signInRoute,
      errorBuilder: (context, state) =>
          const Scaffold(body: Center(child: Text(AppStrings.errorNavigate))),
      routes: [
        GoRoute(
          path: AppRoutes.signInRoute,
          name: AppRoutes.signInRoute,
          builder: (context, state) => const LoginView(),
        ),
        GoRoute(
          path: AppRoutes.signUpRoute,
          name: AppRoutes.signUpRoute,
          builder: (context, state) => const SignUpView(),
        ),
        GoRoute(
          path: AppRoutes.homeRoute,
          name: AppRoutes.homeRoute,
          builder: (context, state) => const HomeLayoutView(),
        ),
        GoRoute(
          path: AppRoutes.forgetPasswordRoute,
          name: AppRoutes.forgetPasswordRoute,
          builder: (context, state) => const ForgetPasswordView(),
        ),
        GoRoute(
          path: AppRoutes.verifyResetCodeRoute,
          name: AppRoutes.verifyResetCodeRoute,

          builder: (context, state) {
            final String email = state.extra as String;
            return VerifyResetCodeView(email: email);
          },
        ),
        GoRoute(
          path: AppRoutes.resetPasswordRoute,
          name: AppRoutes.resetPasswordRoute,
          builder: (context, state) {
            final String email = state.extra as String;
            return ResetPasswordView(email: email);
          },
        ),
        GoRoute(
          path: AppRoutes.subjectExamsRoute,
          name: AppRoutes.subjectExamsRoute,
          builder: (context, state) {
            final ExploreSubjectEntity subject =
                state.extra as ExploreSubjectEntity;
            return SubjectExamView(subject: subject);
          },
        ),
        GoRoute(
          path: AppRoutes.examStartRoute,
          name: AppRoutes.examStartRoute,
          builder: (context, state) {
            final SubjectExamEntity subjectExamEntity =
                state.extra as SubjectExamEntity;
            return ExamStartView(subjectExamEntity: subjectExamEntity);
          },
        ),
        GoRoute(
          path: AppRoutes.examQuestionsRoute,
          name: AppRoutes.examQuestionsRoute,
          builder: (context, state) {
            final String examId = state.extra as String;
            return ExamQuestionsView(examId: examId);
          },
        ),
        GoRoute(
          path: AppRoutes.examScoreRoute,
          name: AppRoutes.examScoreRoute,
          builder: (context, state) {
            final ExamResultState? examResult = state.extra as ExamResultState?;
            return ExamScoreView(examResult: examResult);
          },
        ),
      ],
    );
  }
}
