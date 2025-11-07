import '../../../../../core/constants/api_endpoints/api_keys.dart';
import '../../api_client/forget_password_api_client.dart';
import '../../../data/models/forget_password_response/forget_password_response.dart';
import '../../../data/models/reset_password_response/reset_password_response.dart';
import '../../../data/models/verify_reset_code_response/verify_reset_code_response.dart';
import 'package:injectable/injectable.dart';

import '../../../data/data_sources/remote/remote_data_source_cont.dart';

@Injectable(as: ForgetPasswordRemoteDataSourceContract)
class ForgetPasswordRemoteDataSourceImpl
    extends ForgetPasswordRemoteDataSourceContract {
  ForgetPasswordRemoteDataSourceImpl(this._apiClient);
  final ForgetPasswordApiClient _apiClient;
  @override
  Future<ForgetPasswordResponse> forgetPassword(String email) {
    return _apiClient.forgetPassword({ApiKeys.email: email});
  }

  @override
  Future<ResetPasswordResponse> resetPassword(
    String email,
    String newPassword,
  ) {
    return _apiClient.resetPassword({
      ApiKeys.email: email,
      ApiKeys.newPassword: newPassword,
    });
  }

  @override
  Future<VerifyResetCodeResponse> verifyResetCode(String resetCode) {
    return _apiClient.verifyResetCode({ApiKeys.resetCode: resetCode});
  }
}
