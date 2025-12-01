import 'package:exam_app/features/exam/data/models/exam_questions_response/answer.dart';
import 'package:exam_app/features/exam/data/models/exam_questions_response/exam.dart';
import 'package:exam_app/features/exam/data/models/exam_questions_response/question.dart';
import 'package:exam_app/features/exam/domain/entity/answer_entity.dart';
import 'package:exam_app/features/exam/domain/entity/exam_entity.dart';
import 'package:exam_app/features/exam/domain/entity/question_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'When calling toEntity with a valid Question object, it should return an QuestionEntity object with the correct values',
    () {
      // Arrange
      final List<Answer> answerDtoList = [
        Answer(answer: 'Option A', key: 'A'),
        Answer(answer: 'Option B', key: 'B'),
        Answer(answer: 'Option C', key: 'C'),
        Answer(answer: 'Option D', key: 'D'),
      ];
      final dynamic subject = 'Test Subject';
      final Exam examDto = Exam(
        id: '1',
        title: 'Test Quiz',
        subject: 'Test Subject',
        duration: 20,
        numberOfQuestions: 4,
      );
      final Question questionDto = Question(
        id: '1',
        question: 'Test Question 1',
        answers: answerDtoList,
        type: 'MCQ',
        correct: 'A',
        subject: subject,
        exam: examDto,
      );
      // Act
      final result = questionDto.toEntity();

      // Assert

      expect(result, isA<QuestionEntity>());
      expect(result.id, isA<String?>());
      expect(result.question, isA<String?>());
      expect(result.answers, isA<List<AnswerEntity>>());
      expect(result.type, isA<String?>());
      expect(result.correct, isA<String?>());
      expect(result.subject, isA<dynamic>());
      expect(result.exam, isA<ExamEntity?>());
      final expectedQuestionEntity = QuestionEntity(
        id: '1',
        question: 'Test Question 1',
        answers: answerDtoList.map((e) => e.toAnswerEntity()).toList(),
        type: 'MCQ',
        correct: 'A',
        subject: subject,
        exam: examDto.toExamEntity(),
      );
      expect(result.id, equals(expectedQuestionEntity.id));
      expect(result.question, equals(expectedQuestionEntity.question));
      expect(result.type, equals(expectedQuestionEntity.type));
      expect(result.correct, equals(expectedQuestionEntity.correct));
      expect(result.subject, equals(expectedQuestionEntity.subject));
      expect(
        result.answers?.length,
        equals(expectedQuestionEntity.answers?.length),
      );
      for (int i = 0; i < result.answers!.length; i++) {
        expect(
          result.answers![i].answer,
          equals(expectedQuestionEntity.answers![i].answer),
        );
        expect(
          result.answers![i].key,
          equals(expectedQuestionEntity.answers![i].key),
        );
      }
      expect(result.exam?.id, equals(expectedQuestionEntity.exam?.id));
      expect(result.exam?.title, equals(expectedQuestionEntity.exam?.title));
      expect(
        result.exam?.subject,
        equals(expectedQuestionEntity.exam?.subject),
      );
      expect(
        result.exam?.duration,
        equals(expectedQuestionEntity.exam?.duration),
      );
      expect(
        result.exam?.numberOfQuestions,
        equals(expectedQuestionEntity.exam?.numberOfQuestions),
      );
    },
  );
  test(
    'When calling toEntity with a valid Question object, it should return an QuestionEntity object with the empty string and empty list values',
    () {
      // Arrange
      final List<Answer>? answerDtoList = null;
      final dynamic subject = null;
      final Exam examDto = Exam(
        id: null,
        title: null,
        subject: null,
        duration: null,
        numberOfQuestions: null,
      );
      final Question questionDto = Question(
        id: null,
        question: null,
        answers: answerDtoList,
        type: null,
        correct: null,
        subject: subject,
        exam: examDto,
      );
      // Act
      final result = questionDto.toEntity();

      // Assert
      expect(result, isA<QuestionEntity>());
      expect(result.id, isA<String?>());
      expect(result.question, isA<String?>());
      expect(result.answers, isA<List<AnswerEntity>>());
      expect(result.type, isA<String?>());
      expect(result.correct, isA<String?>());
      expect(result.subject, isA<dynamic>());
      expect(result.exam, isA<ExamEntity?>());

      // Verify nullable string fields return empty strings (not null)
      expect(result.id, equals(''));
      expect(result.question, equals(''));
      expect(result.subject, equals(''));
      expect(result.type, equals(''));
      expect(result.correct, equals(''));

      // Verify answers list is empty (not null)
      expect(result.answers, isEmpty);
      expect(result.answers, isNotNull);

      // Verify exam object is not null but has empty/null properties
      expect(result.exam, isNotNull);
      expect(result.exam?.id, equals(''));
      expect(result.exam?.title, equals(''));
      expect(result.exam?.subject, equals(''));
      expect(result.exam?.duration, equals(0));
      expect(result.exam?.numberOfQuestions, equals(0));
    },
  );
}
