import '../../../../config/base_response/base_response.dart';
import '../entity/verify_reset_code_entity.dart';
import '../repos/forget_password_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyResetOtpUsecase {
  const VerifyResetOtpUsecase(this._forgetPasswordRepoContract);
  final ForgetPasswordRepoContract _forgetPasswordRepoContract;

  Future<BaseResponse<VerifyResetCodeEntity>> call({required String code}) =>
      _forgetPasswordRepoContract.verifyResetCode(resetCode: code);
}
