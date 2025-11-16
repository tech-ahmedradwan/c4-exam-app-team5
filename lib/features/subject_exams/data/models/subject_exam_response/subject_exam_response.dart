import 'package:json_annotation/json_annotation.dart';

import 'exam.dart';
import 'metadata.dart';

part 'subject_exam_response.g.dart';

@JsonSerializable()
class SubjectExamResponse {
  String? message;
  Metadata? metadata;
  List<ExamDto>? exams;

  SubjectExamResponse({this.message, this.metadata, this.exams});

  factory SubjectExamResponse.fromJson(Map<String, dynamic> json) {
    return _$SubjectExamResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SubjectExamResponseToJson(this);
}
