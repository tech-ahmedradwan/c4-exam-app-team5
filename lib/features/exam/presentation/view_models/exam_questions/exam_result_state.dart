import 'package:equatable/equatable.dart';

class ExamResultState extends Equatable {
  const ExamResultState({
    required this.totalQuestions,
    required this.correctAnswers,
    required this.incorrectAnswers,
    required this.scorePercentage,
  });

  final int totalQuestions;
  final int correctAnswers;
  final int incorrectAnswers;
  final double scorePercentage;

  @override
  List<Object?> get props => [
    totalQuestions,
    correctAnswers,
    incorrectAnswers,
    scorePercentage,
  ];
}
