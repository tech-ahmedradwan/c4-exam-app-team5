import '../../../../core/constants/api_endpoints/api_keys.dart';
import '../../data/models/user_info_response/user.dart';

class ProfileEntity {
  ProfileEntity({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  final String? id;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.username: username,
      ApiKeys.firstName: firstName,
      ApiKeys.lastName: lastName,
      ApiKeys.email: email,
      ApiKeys.phone: phone,
    };
  }

  UserProfileDto toDto() {
    return UserProfileDto(
      id: id,
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
    );
  }
}
