import '../../../../../core/constants/api_endpoints/api_keys.dart';

class ChangePasswordDto {
  ChangePasswordDto({
    required this.oldPassword,
    required this.newPassword,
    required this.confirmPassword,
  });
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.oldPassword: oldPassword,
      ApiKeys.password: newPassword,
      ApiKeys.rePassword: confirmPassword,
    };
  }
}
