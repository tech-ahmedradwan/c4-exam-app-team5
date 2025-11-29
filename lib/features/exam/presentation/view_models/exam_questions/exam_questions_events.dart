sealed class ExamQuestionEvents {}

final class GetExamQuestionsDataEvent extends ExamQuestionEvents {
  GetExamQuestionsDataEvent({required this.examId});

  final String examId;
}

final class NextQuestionEvent extends ExamQuestionEvents {}

final class PreviousQuestionEvent extends ExamQuestionEvents {}

final class SelectAnswerEvent extends ExamQuestionEvents {
  SelectAnswerEvent({required this.answerIndex});

  final int answerIndex;
}

final class SubmitExamEvent extends ExamQuestionEvents {}

final class ShowTimeoutDialogEvent extends ExamQuestionEvents {}

final class ExamScoreEvent extends ExamQuestionEvents {}
