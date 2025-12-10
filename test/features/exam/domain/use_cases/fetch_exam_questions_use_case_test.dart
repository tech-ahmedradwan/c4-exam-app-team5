import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/core/errors/failure.dart';
import 'package:exam_app/features/exam/domain/entity/answer_entity.dart';
import 'package:exam_app/features/exam/domain/entity/exam_entity.dart';
import 'package:exam_app/features/exam/domain/entity/question_entity.dart';
import 'package:exam_app/features/exam/domain/repo/exam_repo_contract.dart';
import 'package:exam_app/features/exam/domain/use_cases/fetch_exam_questions_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_exam_questions_use_case_test.mocks.dart';

@GenerateMocks([ExamRepoContract])
void main() {
  late MockExamRepoContract mockExamRepo;
  late FetchExamQuestionsUseCase fetchExamQuestionsUseCase;
  setUpAll(() {
    mockExamRepo = MockExamRepoContract();
    fetchExamQuestionsUseCase = FetchExamQuestionsUseCase(mockExamRepo);
    provideDummy<BaseResponse<List<QuestionEntity>>>(
      const SuccessResponse<List<QuestionEntity>>([]),
    );
    provideDummy<BaseResponse<List<QuestionEntity>>>(
      const ErrorResponse(ServerFailure('error')),
    );
  });
  test(
    'When call fetchExamQuestionsUseCase it should call '
    'examRepo with examId parameter and return a list of questions,',
    () async {
      // Arrange
      final examId = 'exam-id';
      final ExamEntity examEntity = ExamEntity(
        id: '1',
        title: 'Test Quiz',
        subject: 'Test Subject',
        duration: 20,
        numberOfQuestions: 4,
      );
      final List<AnswerEntity> mockAnswerEntityList = [
        AnswerEntity(answer: 'Option A', key: 'A'),
        AnswerEntity(answer: 'Option B', key: 'B'),
        AnswerEntity(answer: 'Option C', key: 'C'),
        AnswerEntity(answer: 'Option D', key: 'D'),
      ];
      final List<QuestionEntity> mockQuestionEntityList = [
        QuestionEntity(
          id: '1',
          question: 'Test Question 1',
          answers: mockAnswerEntityList,
          exam: examEntity,
        ),
        QuestionEntity(
          id: '2',
          question: 'Test Question 2',
          answers: mockAnswerEntityList,
          exam: examEntity,
        ),
      ];
      final getExamQuestionsData = SuccessResponse<List<QuestionEntity>>(
        mockQuestionEntityList,
      );
      when(
        mockExamRepo.fetchExamQuestions(examId),
      ).thenAnswer((_) async => getExamQuestionsData);

      // Act
      final result = await fetchExamQuestionsUseCase(examId: examId);
      // Assert
      expect(result, isA<SuccessResponse<List<QuestionEntity>>>());
      final resultList = result as SuccessResponse<List<QuestionEntity>>;
      expect(resultList.data, mockQuestionEntityList);
      verify(mockExamRepo.fetchExamQuestions(examId)).called(1);
    },
  );
}
