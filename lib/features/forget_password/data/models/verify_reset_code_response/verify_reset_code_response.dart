import '../../../domain/entity/verify_reset_code_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_reset_code_response.g.dart';

@JsonSerializable()
class VerifyResetCodeResponse {
  const VerifyResetCodeResponse({this.status});

  factory VerifyResetCodeResponse.fromJson(Map<String, dynamic> json) {
    return _$VerifyResetCodeResponseFromJson(json);
  }
  final String? status;

  Map<String, dynamic> toJson() => _$VerifyResetCodeResponseToJson(this);
  VerifyResetCodeEntity toEntity() =>
      VerifyResetCodeEntity(status: status ?? '');
}
