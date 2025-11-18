// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
  id: json['_id'] as String?,
  question: json['question'] as String?,
  answers: (json['answers'] as List<dynamic>?)
      ?.map((e) => Answer.fromJson(e as Map<String, dynamic>))
      .toList(),
  type: json['type'] as String?,
  correct: json['correct'] as String?,
  subject: json['subject'],
  exam: json['exam'] == null
      ? null
      : Exam.fromJson(json['exam'] as Map<String, dynamic>),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
  '_id': instance.id,
  'question': instance.question,
  'answers': instance.answers,
  'type': instance.type,
  'correct': instance.correct,
  'subject': instance.subject,
  'exam': instance.exam,
  'createdAt': instance.createdAt?.toIso8601String(),
};
