import '../../../../config/base_response/base_response.dart';
import '../entity/forget_password_entity.dart';
import '../entity/reset_password_entity.dart';
import '../entity/verify_reset_code_entity.dart';

abstract class ForgetPasswordRepoContract {
  Future<BaseResponse<ForgetPasswordEntity>> forgetPassword({
    required String email,
  });

  Future<BaseResponse<VerifyResetCodeEntity>> verifyResetCode({
    required String resetCode,
  });

  Future<BaseResponse<ResetPasswordEntity>> resetPassword({
    required String email,
    required String newPassword,
  });
}
