import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entity/subject_exam_entity.dart';

part 'exam.g.dart';

@JsonSerializable()
class ExamDto {
  ExamDto({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory ExamDto.fromJson(Map<String, dynamic> json) =>
      _$ExamDtoFromJson(json);
  @JsonKey(name: '_id')
  String? id;
  String? title;
  int? duration;
  String? subject;
  int? numberOfQuestions;
  bool? active;
  DateTime? createdAt;

  Map<String, dynamic> toJson() => _$ExamDtoToJson(this);

  SubjectExamEntity toEntity() => SubjectExamEntity(
    id: id,
    title: title,
    duration: duration,
    numberOfQuestions: numberOfQuestions,
  );
}
