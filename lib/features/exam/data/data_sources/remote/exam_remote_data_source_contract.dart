import '../../models/exam_questions_response/exam_questions_response.dart';

abstract interface class ExamRemoteDataSourceContract {
  Future<ExamQuestionsResponse> fetchExamQuestions({required String examId});
}
