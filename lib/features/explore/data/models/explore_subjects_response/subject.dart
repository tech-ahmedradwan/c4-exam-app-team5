import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entity/explore_subject_entity.dart';

part 'subject.g.dart';

@JsonSerializable()
class Subject {
  Subject({this.id, this.name, this.icon, this.createdAt});

  factory Subject.fromJson(Map<String, dynamic> json) {
    return _$SubjectFromJson(json);
  }
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? icon;
  DateTime? createdAt;

  Map<String, dynamic> toJson() => _$SubjectToJson(this);

  ExploreSubjectEntity toEntity() {
    return ExploreSubjectEntity(name: name, id: id, icon: icon);
  }
}
