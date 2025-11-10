import '../../../../core/constants/api_endpoints/api_keys.dart';

class UserEntity {
  factory UserEntity.fromMap(Map<String, dynamic> data) => UserEntity(
    username: data[ApiKeys.username],
    firstName: data[ApiKeys.firstName],
    lastName: data[ApiKeys.lastName],
    email: data[ApiKeys.email],
    password: data[ApiKeys.password],
    rePassword: data[ApiKeys.rePassword],
    phone: data[ApiKeys.phone],
  );

  UserEntity({
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
  });
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String rePassword;
  final String phone;

  Map<String, dynamic> toMap() => {
    ApiKeys.username: username,
    ApiKeys.firstName: firstName,
    ApiKeys.lastName: lastName,
    ApiKeys.email: email,
    ApiKeys.password: password,
    ApiKeys.rePassword: rePassword,
    ApiKeys.phone: phone,
  };
}
