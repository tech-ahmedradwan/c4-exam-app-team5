import 'package:exam_app/features/exam/data/models/exam_questions_response/exam.dart';
import 'package:exam_app/features/exam/domain/entity/exam_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'When calling toExamEntity with a valid Exam object, it should return an ExamEntity object with the correct values',
    () {
      // Arrange
      final Exam examDto = Exam(
        id: '1',
        title: 'Test Quiz',
        subject: 'Test Subject',
        duration: 20,
        numberOfQuestions: 4,
      );

      // Act
      final result = examDto.toExamEntity();

      // Assert

      expect(result, isA<ExamEntity>());
      expect(result.id, isA<String?>());
      expect(result.title, isA<String?>());
      expect(result.subject, isA<String?>());
      expect(result.duration, isA<int?>());
      expect(result.numberOfQuestions, isA<int?>());
      expect(result.duration, isPositive);
      expect(result.numberOfQuestions, isPositive);
      final expectedExamEntity = ExamEntity(
        id: '1',
        title: 'Test Quiz',
        subject: 'Test Subject',
        duration: 20,
        numberOfQuestions: 4,
      );
      expect(result.id, equals(expectedExamEntity.id));
      expect(result.title, equals(expectedExamEntity.title));
      expect(result.subject, equals(expectedExamEntity.subject));
      expect(result.duration, equals(expectedExamEntity.duration));
      expect(
        result.numberOfQuestions,
        equals(expectedExamEntity.numberOfQuestions),
      );
    },
  );
  test(
    'When calling toExamEntity with a valid Exam object, it should return an ExamEntity object with the empty string and zero values',
    () {
      // Arrange
      final Exam examDto = Exam(
        id: null,
        title: null,
        subject: null,
        duration: null,
        numberOfQuestions: null,
      );

      // Act
      final result = examDto.toExamEntity();

      // Assert
      expect(result, isA<ExamEntity>());
      expect(result.id, isA<String?>());
      expect(result.title, isA<String?>());
      expect(result.subject, isA<String?>());
      expect(result.duration, isA<int?>());
      expect(result.numberOfQuestions, isA<int?>());

      expect(result.id, isEmpty);
      expect(result.id, isNotNull);
      expect(result.id, equals(''));

      expect(result.title, isEmpty);
      expect(result.title, isNotNull);
      expect(result.title, equals(''));

      expect(result.subject, isEmpty);
      expect(result.subject, isNotNull);
      expect(result.subject, equals(''));

      expect(result.duration, isNotNull);
      expect(result.duration, isZero);
      expect(result.duration, equals(0));

      expect(result.numberOfQuestions, isNotNull);
      expect(result.numberOfQuestions, isZero);
      expect(result.numberOfQuestions, equals(0));
    },
  );
}
