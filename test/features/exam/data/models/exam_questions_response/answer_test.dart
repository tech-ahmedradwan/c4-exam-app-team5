import 'package:exam_app/features/exam/data/models/exam_questions_response/answer.dart';
import 'package:exam_app/features/exam/domain/entity/answer_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'When calling toAnswerEntity with a valid Answer object, it should return an AnswerEntity object with the correct values',
    () {
      // Arrange
      final Answer answerDto = Answer(answer: 'Option A', key: 'A');

      // Act
      final result = answerDto.toAnswerEntity();

      // Assert
      expect(result, isA<AnswerEntity>());
      expect(result.answer, isA<String?>());
      expect(result.key, isA<String?>());

      final expectedAnswerEntity = AnswerEntity(answer: 'Option A', key: 'A');
      expect(result.answer, equals(expectedAnswerEntity.answer));
      expect(result.key, equals(expectedAnswerEntity.key));
    },
  );
  test(
    'When calling toAnswerEntity with a null Answer object, it should return an AnswerEntity object with empty string values',
    () {
      // Arrange
      final Answer answerDto = Answer(answer: null, key: null);

      // Act
      final result = answerDto.toAnswerEntity();

      // Assert
      expect(result, isA<AnswerEntity>());
      expect(result.answer, isA<String?>());
      expect(result.key, isA<String?>());

      expect(result.answer, equals(''));
      expect(result.key, equals(''));
    },
  );
}
