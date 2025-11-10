import 'package:json_annotation/json_annotation.dart';

import 'metadata.dart';
import 'subject.dart';

part 'explore_subjects_response.g.dart';

@JsonSerializable()
class ExploreSubjectsResponse {
  ExploreSubjectsResponse({this.message, this.metadata, this.subjects});

  factory ExploreSubjectsResponse.fromJson(Map<String, dynamic> json) {
    return _$ExploreSubjectsResponseFromJson(json);
  }
  String? message;
  Metadata? metadata;
  List<Subject>? subjects;

  Map<String, dynamic> toJson() => _$ExploreSubjectsResponseToJson(this);
}
