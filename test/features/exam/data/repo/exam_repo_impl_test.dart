import 'package:dio/dio.dart';
import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/features/exam/api/data_source/remote/exam_remote_data_source_impl.dart';
import 'package:exam_app/features/exam/data/models/exam_questions_response/answer.dart';
import 'package:exam_app/features/exam/data/models/exam_questions_response/exam.dart';
import 'package:exam_app/features/exam/data/models/exam_questions_response/exam_questions_response.dart';
import 'package:exam_app/features/exam/data/models/exam_questions_response/question.dart';
import 'package:exam_app/features/exam/data/repo/exam_repo_impl.dart';
import 'package:exam_app/features/exam/domain/entity/question_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'exam_repo_impl_test.mocks.dart';

@GenerateMocks([ExamRemoteDataSourceImpl])
void main() {
  late ExamRepoImpl examRepoImpl;
  late MockExamRemoteDataSourceImpl mockExamRemoteDataSourceImpl;

  setUpAll(() {
    // ARRANGE ==> Initialize the mocks Dependencies
    mockExamRemoteDataSourceImpl = MockExamRemoteDataSourceImpl();
    examRepoImpl = ExamRepoImpl(mockExamRemoteDataSourceImpl);
  });

  group('fetchExamQuestions Function Test Cases Scenarios', () {
    const examId = 'test-exam-id';

    group('Success Response Test Cases', () {
      const message = 'success';

      test('Test Success Case with QuestionEntity not empty list', () async {
        /// ARRANGE ==> Setup mock data
        final Exam mockExam = Exam(
          id: '1',
          title: 'Test Quiz',
          subject: 'Test Subject',
          duration: 20,
          numberOfQuestions: 4,
        );
        final List<Answer> mockAnswerDtoList = [
          Answer(answer: 'Option A', key: 'A'),
          Answer(answer: 'Option B', key: 'B'),
          Answer(answer: 'Option C', key: 'C'),
          Answer(answer: 'Option D', key: 'D'),
        ];
        final List<Question> mockQuestionDtoList = [
          Question(
            id: '1',
            question: 'Test Question 1',
            answers: mockAnswerDtoList,
            type: 'MCQ',
            correct: 'A',
            subject: 'Test Subject',
            exam: mockExam,
          ),
          Question(
            id: '2',
            question: 'Test Question 2',
            answers: mockAnswerDtoList,
            type: 'MCQ',
            correct: 'B',
            subject: 'Test Subject',
            exam: mockExam,
          ),
          Question(
            id: '3',
            question: 'Test Question 3',
            answers: mockAnswerDtoList,
            type: 'MCQ',
            correct: 'C',
            subject: 'Test Subject',
            exam: mockExam,
          ),
          Question(
            id: '4',
            question: 'Test Question 4',
            answers: mockAnswerDtoList,
            type: 'MCQ',
            correct: 'D',
            subject: 'Test Subject',
            exam: mockExam,
          ),
        ];
        final examQuestionsResponse = ExamQuestionsResponse(
          message: message,
          questions: mockQuestionDtoList,
        );
        when(
          mockExamRemoteDataSourceImpl.fetchExamQuestions(examId: examId),
        ).thenAnswer((_) async => examQuestionsResponse);

        /// ACT ==> Call the repository method
        final result = await examRepoImpl.fetchExamQuestions(examId);

        /// ASSERT ==> Verify the result of QuestionEntityList
        // result is return QuestionEntityList
        expect(result, isA<SuccessResponse<List<QuestionEntity>>>());
        // result is same Size of mockQuestionDtoList
        expect(
          (result as SuccessResponse<List<QuestionEntity>>).data.length,
          mockQuestionDtoList.length,
        );
        // result is same id value of mockQuestionDtoList
        for (int i = 0; i < mockQuestionDtoList.length; i++) {
          expect(result.data[i].id, mockQuestionDtoList[i].id);
          if (kDebugMode) {
            print('id = ${result.data[i].id}');
          }
        }
        // result is same subject value of mockQuestionDtoList
        for (int i = 0; i < mockQuestionDtoList.length; i++) {
          expect(result.data[i].subject, mockQuestionDtoList[i].subject);
          if (kDebugMode) {
            print('subject = ${result.data[i].subject}');
          }
        }
        // result is same correct value of mockQuestionDtoList
        for (int i = 0; i < mockQuestionDtoList.length; i++) {
          expect(result.data[i].correct, mockQuestionDtoList[i].correct);
          if (kDebugMode) {
            print('correct = ${result.data[i].correct}');
          }
        }
        // result is same type value of mockQuestionDtoList
        for (int i = 0; i < mockQuestionDtoList.length; i++) {
          expect(result.data[i].type, mockQuestionDtoList[i].type);
          if (kDebugMode) {
            print('type = ${result.data[i].type}');
          }
        }
        // result is same question value of mockQuestionDtoList
        for (int i = 0; i < mockQuestionDtoList.length; i++) {
          expect(result.data[i].question, mockQuestionDtoList[i].question);
          if (kDebugMode) {
            print('question = ${result.data[i].question}');
          }
        }
        // result is same exam id value of mockQuestionDtoList
        for (int i = 0; i < mockQuestionDtoList.length; i++) {
          expect(result.data[i].exam?.id, mockQuestionDtoList[i].exam?.id);
          if (kDebugMode) {
            print('Exam.id = ${result.data[i].exam?.id}');
          }
        }
        // result is same exam title value of mockQuestionDtoList
        for (int i = 0; i < mockQuestionDtoList.length; i++) {
          expect(
            result.data[i].exam?.title,
            mockQuestionDtoList[i].exam?.title,
          );
          if (kDebugMode) {
            print('Exam.title = ${result.data[i].exam?.title}');
          }
        }
        // result is same exam subject value of mockQuestionDtoList
        for (int i = 0; i < mockQuestionDtoList.length; i++) {
          expect(
            result.data[i].exam?.subject,
            mockQuestionDtoList[i].exam?.subject,
          );
          if (kDebugMode) {
            print('Exam.subject = ${result.data[i].exam?.subject}');
          }
        }
        // result is same exam duration value of mockQuestionDtoList
        for (int i = 0; i < mockQuestionDtoList.length; i++) {
          expect(
            result.data[i].exam?.duration,
            mockQuestionDtoList[i].exam?.duration,
          );
          if (kDebugMode) {
            print('Exam.duration = ${result.data[i].exam?.duration}');
          }
        }
        // result is same exam numberOfQuestions value of mockQuestionDtoList
        for (int i = 0; i < mockQuestionDtoList.length; i++) {
          expect(
            result.data[i].exam?.numberOfQuestions,
            mockQuestionDtoList[i].exam?.numberOfQuestions,
          );
          if (kDebugMode) {
            print(
              'Exam.numberOfQuestions = ${result.data[i].exam?.numberOfQuestions}',
            );
          }
        }
        // result is same Answers key value of mockQuestionDtoList
        for (int i = 0; i < mockQuestionDtoList.length; i++) {
          expect(
            result.data[i].answers?[i].key,
            mockQuestionDtoList[i].answers?[i].key,
          );
          if (kDebugMode) {
            print('Answers.key = ${result.data[i].answers?[i].key}');
          }
        }
        // result is same Answers answer value of mockQuestionDtoList
        for (int i = 0; i < mockQuestionDtoList.length; i++) {
          expect(
            result.data[i].answers?[i].answer,
            mockQuestionDtoList[i].answers?[i].answer,
          );
          if (kDebugMode) {
            print('Answers.answer = ${result.data[i].answers?[i].answer}');
          }
        }

        // verify that the method was called once
        verify(
          mockExamRemoteDataSourceImpl.fetchExamQuestions(examId: examId),
        ).called(1);
      });
      test('Test Success Case with QuestionEntity empty list', () async {
        // ARRANGE - Setup mock with empty list
        final List<Question> mockQuestionDtoList = [];
        when(
          mockExamRemoteDataSourceImpl.fetchExamQuestions(examId: examId),
        ).thenAnswer(
          (_) async => ExamQuestionsResponse(
            message: message,
            questions: mockQuestionDtoList,
          ),
        );

        // ACT
        final result = await examRepoImpl.fetchExamQuestions(examId);

        // ASSERT
        expect(result, isA<SuccessResponse<List<QuestionEntity>>>());
        expect((result as SuccessResponse<List<QuestionEntity>>).data, isEmpty);
        expect(result.data.length, isZero);
        verify(
          mockExamRemoteDataSourceImpl.fetchExamQuestions(examId: examId),
        ).called(1);
      });
      test('Test Success Case with QuestionEntity null value', () async {
        // ARRANGE - Setup mock with null questions
        final List<Question>? mockQuestionDtoList = null;
        when(
          mockExamRemoteDataSourceImpl.fetchExamQuestions(examId: examId),
        ).thenAnswer(
          (_) async => ExamQuestionsResponse(
            message: message,
            questions: mockQuestionDtoList,
          ),
        );

        // ACT
        final result = await examRepoImpl.fetchExamQuestions(examId);

        // ASSERT - Should return empty list, not null
        expect(result, isA<SuccessResponse<List<QuestionEntity>>>());
        expect((result as SuccessResponse<List<QuestionEntity>>).data, isEmpty);
        expect(result.data.length, isZero);
        verify(
          mockExamRemoteDataSourceImpl.fetchExamQuestions(examId: examId),
        ).called(1);
      });
      test('Test Success Case with single question', () async {
        // ARRANGE - Setup mock with single question
        final Exam mockExam = Exam(
          id: '1',
          title: 'Math Quiz',
          subject: 'Math',
          duration: 5,
          numberOfQuestions: 1,
        );
        final List<Answer> mockAnswerList = [
          Answer(answer: '3', key: 'A'),
          Answer(answer: '4', key: 'B'),
          Answer(answer: '5', key: 'C'),
        ];
        final Question mockQuestion = Question(
          id: '1',
          question: 'What is 2+2 ?',
          answers: mockAnswerList,
          type: 'MCQ',
          correct: 'B',
          subject: 'Math',
          exam: mockExam,
        );
        when(
          mockExamRemoteDataSourceImpl.fetchExamQuestions(examId: examId),
        ).thenAnswer(
          (_) async => ExamQuestionsResponse(
            message: message,
            questions: [mockQuestion],
          ),
        );

        // ACT
        final result = await examRepoImpl.fetchExamQuestions(examId);

        // ASSERT
        expect(result, isA<SuccessResponse<List<QuestionEntity>>>());
        expect(
          (result as SuccessResponse<List<QuestionEntity>>).data,
          isNotEmpty,
        );
        expect(result.data.length, 1);
        expect(result.data[0].id, '1');
        expect(result.data[0].question, 'What is 2+2 ?');
        expect(result.data[0].correct, 'B');
        verify(
          mockExamRemoteDataSourceImpl.fetchExamQuestions(examId: examId),
        ).called(1);
      });
      test('Test Success Case QuestionEntity with no answers', () async {
        // ARRANGE - Setup mock with questions that have null/empty answers
        final mockExam = Exam(
          id: '1',
          title: 'Quiz',
          subject: 'Test',
          duration: 10,
          numberOfQuestions: 2,
        );
        final mockQuestions = [
          Question(
            id: '1',
            question: 'Question with null answers',
            answers: null,
            type: 'MCQ',
            correct: 'A',
            subject: 'Test',
            exam: mockExam,
          ),
          Question(
            id: '2',
            question: 'Question with empty answers',
            answers: [],
            type: 'MCQ',
            correct: 'B',
            subject: 'Test',
            exam: mockExam,
          ),
        ];

        when(
          mockExamRemoteDataSourceImpl.fetchExamQuestions(examId: examId),
        ).thenAnswer(
          (_) async =>
              ExamQuestionsResponse(message: message, questions: mockQuestions),
        );

        // ACT
        final result = await examRepoImpl.fetchExamQuestions(examId);

        // ASSERT
        expect(result, isA<SuccessResponse<List<QuestionEntity>>>());
        final data = (result as SuccessResponse<List<QuestionEntity>>).data;
        expect(data.length, 2);
        // Both null and empty answers get converted to empty list by toEntity()
        expect(data[0].answers, isEmpty);
        expect(data[1].answers, isEmpty);
        verify(
          mockExamRemoteDataSourceImpl.fetchExamQuestions(examId: examId),
        ).called(1);
      });
    });

    group('Error Response Test Cases', () {
      group('Dio Exception Test Cases', () {
        test('Test Error Case with Dio Exception', () async {
          // ARRANGE - Setup mock to throw DioException
          final dioException = DioException(
            requestOptions: RequestOptions(path: '/exams/$examId/questions'),
            response: Response(
              requestOptions: RequestOptions(path: '/exams/$examId/questions'),
              statusCode: 500,
              statusMessage: 'Internal Server Error',
            ),
            type: DioExceptionType.badResponse,
            message: 'Server error occurred',
          );

          when(
            mockExamRemoteDataSourceImpl.fetchExamQuestions(examId: examId),
          ).thenThrow(dioException);

          // ACT
          final result = await examRepoImpl.fetchExamQuestions(examId);

          // ASSERT
          expect(result, isA<ErrorResponse>());
          final errorResponse = result as ErrorResponse;
          expect(errorResponse.failure, isNotNull);
          expect(errorResponse.failure.message, 'Server error occurred.');
          verify(
            mockExamRemoteDataSourceImpl.fetchExamQuestions(examId: examId),
          ).called(1);
        });
        test('Test Error Case with DioException - Network Timeout', () async {
          // ARRANGE - Setup mock to throw timeout exception
          final dioException = DioException(
            requestOptions: RequestOptions(path: '/exams/$examId/questions'),
            type: DioExceptionType.connectionTimeout,
            message: 'Connection timeout',
          );

          when(
            mockExamRemoteDataSourceImpl.fetchExamQuestions(examId: examId),
          ).thenThrow(dioException);

          // ACT
          final result = await examRepoImpl.fetchExamQuestions(examId);

          // ASSERT
          expect(result, isA<ErrorResponse>());
          final errorResponse = result as ErrorResponse;
          expect(errorResponse.failure, isNotNull);
          expect(errorResponse.failure.message, 'Server error occurred.');
          verify(
            mockExamRemoteDataSourceImpl.fetchExamQuestions(examId: examId),
          ).called(1);
        });
        test('Test Error Case with DioException - 404 Not Found', () async {
          // ARRANGE - Setup mock to throw 404 exception
          final dioException = DioException(
            requestOptions: RequestOptions(path: '/exams/$examId/questions'),
            response: Response(
              requestOptions: RequestOptions(path: '/exams/$examId/questions'),
              statusCode: 404,
              statusMessage: 'Not Found',
            ),
            type: DioExceptionType.badResponse,
            message: 'Exam not found',
          );

          when(
            mockExamRemoteDataSourceImpl.fetchExamQuestions(examId: examId),
          ).thenThrow(dioException);

          // ACT
          final result = await examRepoImpl.fetchExamQuestions(examId);

          // ASSERT
          expect(result, isA<ErrorResponse>());
          final errorResponse = result as ErrorResponse;
          expect(errorResponse.failure, isNotNull);
          expect(errorResponse.failure.message, 'Server error occurred.');
          verify(
            mockExamRemoteDataSourceImpl.fetchExamQuestions(examId: examId),
          ).called(1);
        });
        test('Test Error Case with DioException - 401 Unauthorized', () async {
          // ARRANGE - Setup mock to throw 401 exception
          final dioException = DioException(
            requestOptions: RequestOptions(path: '/exams/$examId/questions'),
            response: Response(
              requestOptions: RequestOptions(path: '/exams/$examId/questions'),
              statusCode: 401,
              statusMessage: 'Unauthorized',
            ),
            type: DioExceptionType.badResponse,
            message: 'Authentication required',
          );

          when(
            mockExamRemoteDataSourceImpl.fetchExamQuestions(examId: examId),
          ).thenThrow(dioException);

          // ACT
          final result = await examRepoImpl.fetchExamQuestions(examId);

          // ASSERT
          expect(result, isA<ErrorResponse>());
          final errorResponse = result as ErrorResponse;
          expect(errorResponse.failure, isNotNull);
          expect(errorResponse.failure.message, 'Server error occurred.');
          verify(
            mockExamRemoteDataSourceImpl.fetchExamQuestions(examId: examId),
          ).called(1);
        });
        test(
          'Test Error Case with DioException - No Internet Connection',
          () async {
            // ARRANGE - Setup mock to throw no connection exception
            final dioException = DioException(
              requestOptions: RequestOptions(path: '/exams/$examId/questions'),
              type: DioExceptionType.connectionError,
              message: 'No internet connection',
            );

            when(
              mockExamRemoteDataSourceImpl.fetchExamQuestions(examId: examId),
            ).thenThrow(dioException);

            // ACT
            final result = await examRepoImpl.fetchExamQuestions(examId);

            // ASSERT
            expect(result, isA<ErrorResponse>());
            final errorResponse = result as ErrorResponse;
            expect(errorResponse.failure, isNotNull);
            expect(errorResponse.failure.message, 'Server error occurred.');
            verify(
              mockExamRemoteDataSourceImpl.fetchExamQuestions(examId: examId),
            ).called(1);
          },
        );
      });

      group('Generic Exception Test Cases', () {
        test('Test Error Case with Exception', () async {
          // ARRANGE - Setup mock to throw generic Exception
          final exception = Exception('Unexpected error occurred');

          when(
            mockExamRemoteDataSourceImpl.fetchExamQuestions(examId: examId),
          ).thenThrow(exception);

          // ACT
          final result = await examRepoImpl.fetchExamQuestions(examId);

          // ASSERT
          expect(result, isA<ErrorResponse>());
          final errorResponse = result as ErrorResponse;
          expect(errorResponse.failure, isNotNull);
          expect(
            errorResponse.failure.message,
            'An unexpected error occurred.',
          );
          verify(
            mockExamRemoteDataSourceImpl.fetchExamQuestions(examId: examId),
          ).called(1);
        });
      });
    });
  });
}
