import 'package:json_annotation/json_annotation.dart';

part 'metadata.g.dart';

@JsonSerializable()
class Metadata {
  Metadata({this.currentPage, this.numberOfPages, this.limit});

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return _$MetadataFromJson(json);
  }
  int? currentPage;
  int? numberOfPages;
  int? limit;

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}
