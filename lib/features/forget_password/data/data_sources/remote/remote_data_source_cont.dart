import '../../models/forget_password_response/forget_password_response.dart';
import '../../models/reset_password_response/reset_password_response.dart';
import '../../models/verify_reset_code_response/verify_reset_code_response.dart';

abstract class ForgetPasswordRemoteDataSourceContract {
  Future<ForgetPasswordResponse> forgetPassword(String email);
  Future<VerifyResetCodeResponse> verifyResetCode(String resetCode);
  Future<ResetPasswordResponse> resetPassword(String email, String newPassword);
}
