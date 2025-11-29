import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entity/profile_entity.dart';

part 'user.g.dart';

@JsonSerializable()
class UserProfileDto {
  UserProfileDto({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.createdAt,
  });

  factory UserProfileDto.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDtoFromJson(json);
  @JsonKey(name: '_id')
  String? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? role;
  bool? isVerified;
  DateTime? createdAt;

  Map<String, dynamic> toJson() => _$UserProfileDtoToJson(this);
  ProfileEntity toEntity() {
    return ProfileEntity(
      id: id,
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
    );
  }

  @override
  operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserProfileDto &&
        other.id == id &&
        other.username == username &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.email == email &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        email.hashCode ^
        phone.hashCode;
  }
}
