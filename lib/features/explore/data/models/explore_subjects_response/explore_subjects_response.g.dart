// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'explore_subjects_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExploreSubjectsResponse _$ExploreSubjectsResponseFromJson(
  Map<String, dynamic> json,
) => ExploreSubjectsResponse(
  message: json['message'] as String?,
  metadata: json['metadata'] == null
      ? null
      : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
  subjects: (json['subjects'] as List<dynamic>?)
      ?.map((e) => Subject.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ExploreSubjectsResponseToJson(
  ExploreSubjectsResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'metadata': instance.metadata,
  'subjects': instance.subjects,
};
