import 'package:injectable/injectable.dart';

import '../../../data/data_source/profile_remote_data_source/profile_remote_data_source_contract.dart';
import '../../../data/models/change_password_response/change_password_response.dart';
import '../../../data/models/user_info_response/user_info_response.dart';
import '../../api_client/profile_api_client.dart';

@Injectable(as: ProfileRemoteDataSourceContract)
class ProfileRemoteDatasourceImpl implements ProfileRemoteDataSourceContract {
  ProfileRemoteDatasourceImpl(this._apiClient);
  final ProfileApiClient _apiClient;
  @override
  Future<ChangePasswordResponse> changePassword(
    Map<String, dynamic> passwordData,
  ) {
    return _apiClient.changePassword(passwordData);
  }

  @override
  Future<UserInfoResponse> getUserProfile() {
    return _apiClient.getUserProfile();
  }

  @override
  Future<UserInfoResponse> updateUserProfile(Map<String, dynamic> updateData) {
    return _apiClient.updateUserProfile(updateData);
  }
}
