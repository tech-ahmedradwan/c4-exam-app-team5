import '../../models/change_password_response/change_password_response.dart';
import '../../models/user_info_response/user_info_response.dart';

abstract class ProfileRemoteDataSourceContract {
  Future<UserInfoResponse> getUserProfile();
  Future<UserInfoResponse> updateUserProfile(Map<String, dynamic> updateData);
  Future<ChangePasswordResponse> changePassword(
    Map<String, dynamic> passwordData,
  );
}
