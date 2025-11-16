import 'package:json_annotation/json_annotation.dart';
import '../../../domain/entity/question_entity.dart';
import 'answer.dart';
import 'exam.dart';

part 'question.g.dart';

@JsonSerializable()
class Question {
  Question({
    this.id,
    this.question,
    this.answers,
    this.type,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'question')
  String? question;
  @JsonKey(name: 'answers')
  List<Answer>? answers;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'correct')
  String? correct;
  @JsonKey(name: 'subject')
  dynamic subject;
  @JsonKey(name: 'exam')
  Exam? exam;
  @JsonKey(name: 'createdAt')
  DateTime? createdAt;

  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  QuestionEntity toEntity() {
    return QuestionEntity(
      id: id ?? '',
      question: question ?? '',
      answers: answers?.map((e) => e.toAnswerEntity()).toList() ?? [],
      type: type ?? '',
      correct: correct ?? '',
      subject: subject ?? '',
      exam: exam?.toExamEntity()
    );
  }
}
