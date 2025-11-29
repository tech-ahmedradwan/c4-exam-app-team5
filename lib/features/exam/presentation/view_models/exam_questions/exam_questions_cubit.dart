import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/base_state/base_state.dart';
import '../../../domain/use_cases/fetch_exam_questions_use_case.dart';
import 'exam_questions_events.dart';
import 'exam_questions_state.dart';
import 'exam_result_state.dart';

@injectable
class ExamQuestionsCubit extends Cubit<ExamQuestionsState> {
  ExamQuestionsCubit(this._examQuestionsUseCase)
    : super(const ExamQuestionsState());

  final FetchExamQuestionsUseCase _examQuestionsUseCase;
  Timer? _timer;

  /*
  * Test mode configuration - change these values to test different scenarios
  * 1. Set TEST_MODE to true to enable test mode.
  * 2. Set TEST_DURATION to the desired duration in minutes.
  */
  static const bool _isTestMode = bool.fromEnvironment(
    'TEST_MODE',
    defaultValue: false,
  );
  static const int _testDurationMinutes = int.fromEnvironment(
    'TEST_DURATION',
    defaultValue: 1,
  );

  //------------ Actions method -----------------//
  void doIntent(ExamQuestionEvents event) {
    switch (event) {
      case GetExamQuestionsDataEvent():
        _getExamQuestions(event.examId);
      case NextQuestionEvent():
        _nextQuestion();
      case PreviousQuestionEvent():
        _previousQuestion();
      case SelectAnswerEvent():
        _selectAnswer(event.answerIndex);
      case ShowTimeoutDialogEvent():
        _handleTimeoutDialog();
      case ExamScoreEvent():
        _navigateToScore();
        _submitExam();
      case SubmitExamEvent():
        _submitExam();
    }
  }

  //------------ Api call method -----------------//
  void _getExamQuestions(String examId) async {
    emit(state.copyWith(questionState: const BaseState(isLoading: true)));
    final result = await _examQuestionsUseCase(examId: examId);
    result.when(
      onSuccess: (questions) {
        if (questions.isNotEmpty) {
          // Test duration if in test mode, otherwise use actual exam duration
          final int durationInMinutes = _isTestMode
              ? _testDurationMinutes
              : (questions.first.exam?.duration ?? 0);
          // Get exam duration in minutes and convert to seconds
          final int durationInSeconds = durationInMinutes * 60;
          emit(
            state.copyWith(
              questionState: BaseState(data: questions),
              currentQuestionIndex: 0,
              clearSelectedAnswer: true,
              examDuration: durationInMinutes,
              timerState: state.timerState.copyWith(
                remainingSeconds: durationInSeconds,
                isRunning: true,
              ),
            ),
          );
        }
        // Start the countdown timer
        _startTimer();
      },
      onError: (error) => emit(
        state.copyWith(questionState: BaseState(errorMessage: error.message)),
      ),
    );
  }

  //------------ Start Timer method -----------------//
  /// Create a new timer that ticks every second.
  /// And update the state accordingly.
  void _startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.timerState.isRunning && state.timerState.remainingSeconds > 0) {
        _timerTick();
      } else {
        timer.cancel();
      }
    });
  }

  //------------ Timer Tick method -----------------//
  void _timerTick() {
    if (state.timerState.isRunning) {
      final newRemaining = state.timerState.remainingSeconds - 1;
      if (newRemaining <= 0) {
        _stopTimer();
        emit(
          state.copyWith(
            timerState: state.timerState.copyWith(
              remainingSeconds: 0,
              isRunning: false,
              isCompleted: true,
            ),
            showTimeoutDialog: true,
          ),
        );
      } else {
        emit(
          state.copyWith(
            timerState: state.timerState.copyWith(
              remainingSeconds: newRemaining,
              isRunning: true,
            ),
          ),
        );
      }
    }
  }

  //------------ Stop Timer method -----------------//
  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  //------------ Select Answer method -----------------//
  void _selectAnswer(int answerIndex) {
    emit(state.copyWith(selectedAnswerIndex: answerIndex));
  }

  //------------ Save User Answer method -----------------//
  Map<int, int> _saveUserAnswer() {
    // Create a mutable copy of the userAnswers map
    final updatedAnswers = Map<int, int>.from(state.userAnswers);
    // Save the selected answer for the current question
    if (state.selectedAnswerIndex != -1) {
      updatedAnswers[state.currentQuestionIndex] = state.selectedAnswerIndex!;
    }
    return updatedAnswers;
  }

  //------------ Navigate To Next Question method -----------------//
  void _nextQuestion() {
    final nextQuestionIndex = state.currentQuestionIndex + 1;
    if (state.canGoNext) {
      emit(
        state.copyWith(
          currentQuestionIndex: nextQuestionIndex,
          userAnswers: _saveUserAnswer(),
          clearSelectedAnswer: true,
        ),
      );
    }
  }

  //------------ Navigate To Previous Question method -----------------//
  void _previousQuestion() {
    final previousQuestionIndex = state.currentQuestionIndex - 1;
    if (state.canGoBack) {
      // Restore the previously selected answer if it exists
      final previousAnswer = state.userAnswers[previousQuestionIndex];
      emit(
        state.copyWith(
          currentQuestionIndex: previousQuestionIndex,
          selectedAnswerIndex: previousAnswer,
          clearSelectedAnswer: previousAnswer == null,
        ),
      );
    }
  }

  //------------ Calculate Score method -----------------//
  ExamResultState? _calculateScore(Map<int, int> userAnswers) {
    final questions = state.questionState.data ?? [];
    if (questions.isEmpty) return null;

    int correctCount = 0;
    for (int i = 0; i < questions.length; i++) {
      final question = questions[i];
      final userAnswerIndex = userAnswers[i];

      // Skip if user didn't answer this question
      if (userAnswerIndex == null) continue;

      // Get the correct answer key (e.g., "A", "B", "C", "D")
      final correctAnswerKey = question.correct;

      // Get the user's selected answer key from the answers list
      final userAnswerKey = question.answers?[userAnswerIndex].key;

      // Compare the keys
      if (userAnswerKey != null &&
          correctAnswerKey != null &&
          userAnswerKey == correctAnswerKey) {
        correctCount++;
      }
    }

    final int totalQuestions = questions.length;
    final int incorrectCount = totalQuestions - correctCount;
    final double scorePercentage = (correctCount / totalQuestions) * 100;

    // Debug logging
    log('>>>>>>>>>>>Total Questions: $totalQuestions');
    log('>>>>>>>>>>>Correct Answers: $correctCount');
    log('>>>>>>>>>>>Incorrect Answers: $incorrectCount');
    log('>>>>>>>>>>>Final Score: ${scorePercentage.toStringAsFixed(2)}%');

    return ExamResultState(
      totalQuestions: totalQuestions,
      correctAnswers: correctCount,
      incorrectAnswers: incorrectCount,
      scorePercentage: scorePercentage,
    );
  }

  //------------ Submit/Finish Exam method -----------------//
  void _submitExam() {
    final userAnswers = _saveUserAnswer();
    final examResult = _calculateScore(userAnswers);
    _stopTimer();

    if (state.submitExam) {
      emit(
        state.copyWith(
          clearSelectedAnswer: true,
          userAnswers: userAnswers,
          navigateTo: NavigationAction.scoreScreen,
          timerState: state.timerState.copyWith(isRunning: false),
          examResultState: examResult,
        ),
      );
    }
  }

  //----------- Reset Timeout Dialog method -----------------//
  void _handleTimeoutDialog() {
    // Reset the dialog flag after it's been acknowledged by the UI
    emit(state.copyWith(showTimeoutDialog: false));
  }

  //------------ Navigation Action To Exam Score Screen method -----------------//
  void _navigateToScore() {
    final userAnswers = _saveUserAnswer();
    final examResult = _calculateScore(userAnswers);

    emit(
      state.copyWith(
        navigateTo: NavigationAction.scoreScreen,
        examResultState: examResult,
        userAnswers: userAnswers,
      ),
    );
  }

  //------------ Reset Navigation Action method -----------------//
  void resetNavigation() {
    // Reset navigation state after navigation is handled
    emit(state.copyWith(navigateTo: NavigationAction.none));
  }

  //------------ Close method -----------------//
  @override
  Future<void> close() {
    _stopTimer();
    return super.close();
  }
}
