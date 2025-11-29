import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entity/change_pssword_entity.dart';

part 'change_password_response.g.dart';

@JsonSerializable()
class ChangePasswordResponse {
  ChangePasswordResponse({this.message, this.token});

  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) {
    return _$ChangePasswordResponseFromJson(json);
  }
  String? message;
  String? token;
  ChangePasswordEntity toEntity() {
    return ChangePasswordEntity(message: message, token: token);
  }

  Map<String, dynamic> toJson() => _$ChangePasswordResponseToJson(this);
}
