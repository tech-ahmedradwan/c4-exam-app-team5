import '../../../domain/entity/forget_password_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forget_password_response.g.dart';

@JsonSerializable()
class ForgetPasswordResponse {
  ForgetPasswordResponse({this.message, this.info});

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return _$ForgetPasswordResponseFromJson(json);
  }
  String? message;
  String? info;

  Map<String, dynamic> toJson() => _$ForgetPasswordResponseToJson(this);

  ForgetPasswordEntity toEntity() =>
      ForgetPasswordEntity(message: message ?? '', info: info ?? '');
}
