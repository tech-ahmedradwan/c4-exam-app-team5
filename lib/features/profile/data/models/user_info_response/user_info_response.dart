import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'user_info_response.g.dart';

@JsonSerializable()
class UserInfoResponse {
  UserInfoResponse({this.message, this.user});

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) {
    return _$UserInfoResponseFromJson(json);
  }
  String? message;
  UserProfileDto? user;

  Map<String, dynamic> toJson() => _$UserInfoResponseToJson(this);
}
