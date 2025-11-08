import '../../../../config/base_response/base_response.dart';
import '../entity/forget_password_entity.dart';
import '../repos/forget_password_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordUsecase {
  ForgetPasswordUsecase(this._forgetPasswordRepoContract);
  final ForgetPasswordRepoContract _forgetPasswordRepoContract;
  Future<BaseResponse<ForgetPasswordEntity>> call({required String email}) =>
      _forgetPasswordRepoContract.forgetPassword(email: email);
}
