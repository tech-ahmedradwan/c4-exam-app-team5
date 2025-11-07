import '../../../../config/base_response/base_response.dart';
import '../entity/reset_password_entity.dart';
import '../repos/forget_password_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUsecase {
  const ResetPasswordUsecase(this._forgetPassword);
  final ForgetPasswordRepoContract _forgetPassword;
  Future<BaseResponse<ResetPasswordEntity>> call({
    required String email,
    required String newPassword,
  }) => _forgetPassword.resetPassword(email: email, newPassword: newPassword);
}
