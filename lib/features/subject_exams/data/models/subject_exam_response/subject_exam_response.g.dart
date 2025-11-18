// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_exam_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectExamResponse _$SubjectExamResponseFromJson(Map<String, dynamic> json) =>
    SubjectExamResponse(
      message: json['message'] as String?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      exams: (json['exams'] as List<dynamic>?)
          ?.map((e) => ExamDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SubjectExamResponseToJson(
  SubjectExamResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'metadata': instance.metadata,
  'exams': instance.exams,
};
