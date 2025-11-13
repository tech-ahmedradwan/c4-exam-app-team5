import 'package:json_annotation/json_annotation.dart';
import 'question.dart';

part 'exam_questions_response.g.dart';

@JsonSerializable()
class ExamQuestionsResponse {
  ExamQuestionsResponse({this.message, this.questions});

  factory ExamQuestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ExamQuestionsResponseFromJson(json);

  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'questions')
  List<Question>? questions;

  Map<String, dynamic> toJson() => _$ExamQuestionsResponseToJson(this);
}
