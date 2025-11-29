import 'package:equatable/equatable.dart';

import '../../../../../config/base_state/base_state.dart';
import '../../../domain/entity/question_entity.dart';
import 'exam_result_state.dart';
import 'timer_state.dart';

class ExamQuestionsState extends Equatable {
  const ExamQuestionsState({
    this.questionState = const BaseState<List<QuestionEntity>>(),
    this.currentQuestionIndex = 0,
    this.selectedAnswerIndex,
    this.timerState = const TimerState.initial(),
    this.showTimeoutDialog = false,
    this.examDuration = 0,
    this.navigateTo = NavigationAction.none,
    this.userAnswers = const {},
    this.examResultState,
  });

  final BaseState<List<QuestionEntity>> questionState;
  final int currentQuestionIndex;
  final int? selectedAnswerIndex;
  final TimerState timerState;
  final bool showTimeoutDialog;
  final int examDuration; // Duration in minutes
  final NavigationAction navigateTo;
  final Map<int, int> userAnswers;
  final ExamResultState? examResultState;

  // Get the current question
  QuestionEntity? get currentQuestion {
    if (questionState.data != null &&
        questionState.data!.isNotEmpty &&
        currentQuestionIndex < questionState.data!.length) {
      return questionState.data![currentQuestionIndex];
    }
    return null;
  }

  // Get the current question number
  int get currentQuestionNumber => currentQuestionIndex + 1;

  // Get the total number of questions
  int get totalQuestions => questionState.data?.length ?? 0;

  // Get the progress value as a percentage
  double get progressValue {
    if (totalQuestions == 0) return 0.0;
    return currentQuestionNumber / totalQuestions;
  }

  // Get whether the user can go back
  bool get canGoBack => currentQuestionIndex > 0;

  // Get whether the user can go next
  bool get canGoNext => currentQuestionIndex < totalQuestions - 1;

  // Get whether user has selected an answer
  bool get hasSelectedAnswer => selectedAnswerIndex != null;

  // Get whether the user can proceed (next or finish) - must select answer first
  bool get canProceed => hasSelectedAnswer;

  // Get whether the user can submit the exam
  bool get submitExam => selectedAnswerIndex != null;

  ExamQuestionsState copyWith({
    BaseState<List<QuestionEntity>>? questionState,
    int? currentQuestionIndex,
    int? selectedAnswerIndex,
    bool clearSelectedAnswer = false,
    TimerState? timerState,
    bool? showTimeoutDialog,
    int? examDuration,
    NavigationAction? navigateTo,
    Map<int, int>? userAnswers,
    ExamResultState? examResultState,
  }) {
    return ExamQuestionsState(
      questionState: questionState ?? this.questionState,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
      selectedAnswerIndex: clearSelectedAnswer
          ? null
          : (selectedAnswerIndex ?? this.selectedAnswerIndex),
      timerState: timerState ?? this.timerState,
      showTimeoutDialog: showTimeoutDialog ?? this.showTimeoutDialog,
      examDuration: examDuration ?? this.examDuration,
      navigateTo: navigateTo ?? this.navigateTo,
      userAnswers: userAnswers ?? this.userAnswers,
      examResultState: examResultState ?? this.examResultState,
    );
  }

  @override
  List<Object?> get props => [
    questionState,
    currentQuestionIndex,
    selectedAnswerIndex,
    timerState,
    showTimeoutDialog,
    examDuration,
    navigateTo,
    userAnswers,
    examResultState,
  ];
}

enum NavigationAction { scoreScreen, none }
