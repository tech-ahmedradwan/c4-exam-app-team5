import 'package:exam_app/features/exam/api/api_client/exam_api_client.dart';
import 'package:exam_app/features/exam/api/data_source/remote/exam_remote_data_source_impl.dart';
import 'package:exam_app/features/exam/data/models/exam_questions_response/exam_questions_response.dart';
import 'package:exam_app/features/exam/data/models/exam_questions_response/question.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'exam_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([ExamApiClient])
void main() {
  late MockExamApiClient apiClient;
  late ExamRemoteDataSourceImpl remoteDataSource;

  setUpAll(() {
    apiClient = MockExamApiClient();
    remoteDataSource = ExamRemoteDataSourceImpl(apiClient);
  });
  const examId = 'test-exam-id';
  const message = 'success';
  test(
    'In case call fetchExamQuestions() and api return non-empty List<Question>',
    () async {
      // ARRANGE
      final List<Question> questionDtoList = [
        Question(id: '1', question: 'Test Question 1'),
        Question(id: '2', question: 'Test Question 2'),
      ];
      final examQuestionsResponse = ExamQuestionsResponse(
        message: message,
        questions: questionDtoList,
      );
      when(
        apiClient.fetchExamQuestions(examId: examId),
      ).thenAnswer((_) async => examQuestionsResponse);

      // ACT
      final result = await remoteDataSource.fetchExamQuestions(examId: examId);
      // ASSERT
      expect(result, isA<ExamQuestionsResponse>());
      expect(result.message, isA<String>());
      expect(result.questions.runtimeType, equals(List<Question>));
      expect(result.message, equals(examQuestionsResponse.message));
      expect(result.questions, equals(examQuestionsResponse.questions));
    },
  );
  test(
    'In case call fetchExamQuestions() and api return null question',
    () async {
      // ARRANGE
      final examQuestionsResponse = ExamQuestionsResponse(
        message: message,
        questions: null,
      );
      when(
        apiClient.fetchExamQuestions(examId: examId),
      ).thenAnswer((_) async => examQuestionsResponse);

      // ACT
      final result = await remoteDataSource.fetchExamQuestions(examId: examId);
      // ASSERT
      expect(result, isA<ExamQuestionsResponse>());
      expect(result.message, isA<String>());
      expect(result.message, equals(examQuestionsResponse.message));
      expect(result.questions, equals(isNull));
    },
  );
}
