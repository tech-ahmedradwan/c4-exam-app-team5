import 'answer_entity.dart';
import 'exam_entity.dart';

class QuestionEntity {
  QuestionEntity({
    this.id,
    this.question,
    this.answers,
    this.type,
    this.correct,
    this.subject,
    this.exam,
  });

  final String? id;
  final String? question;
  final List<AnswerEntity>? answers;
  final String? type;
  final String? correct;
  final dynamic subject;
  final ExamEntity? exam;
}
