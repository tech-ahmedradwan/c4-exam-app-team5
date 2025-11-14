import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entity/exam_entity.dart';

part 'exam.g.dart';

@JsonSerializable()
class Exam {
  Exam({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);

  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'duration')
  int? duration;
  @JsonKey(name: 'subject')
  String? subject;
  @JsonKey(name: 'numberOfQuestions')
  int? numberOfQuestions;
  @JsonKey(name: 'active')
  bool? active;
  @JsonKey(name: 'createdAt')
  DateTime? createdAt;

  Map<String, dynamic> toJson() => _$ExamToJson(this);

  ExamEntity toExamEntity() {
    return ExamEntity(
      id: id ?? '',
      title: title ?? '',
      duration: duration ?? 0,
      subject: subject ?? '',
      numberOfQuestions: numberOfQuestions ?? 0
    );
  }
}
