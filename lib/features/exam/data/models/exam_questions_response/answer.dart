import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entity/answer_entity.dart';

part 'answer.g.dart';

@JsonSerializable()
class Answer {
  Answer({this.answer, this.key});

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  @JsonKey(name: 'answer')
  String? answer;
  @JsonKey(name: 'key')
  String? key;

  Map<String, dynamic> toJson() => _$AnswerToJson(this);

  AnswerEntity toAnswerEntity() {
    return AnswerEntity(answer: answer ?? '', key: key ?? '');
  }
}
