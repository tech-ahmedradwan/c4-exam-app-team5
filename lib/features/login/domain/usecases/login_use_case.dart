import 'package:injectable/injectable.dart';
import '../../../../config/base_response/base_response.dart';
import '../repos/login_repo_contract.dart';

@injectable
class LoginUseCase {
  LoginUseCase({required this.loginRepo});
  final LoginRepoContract loginRepo;
  Future<BaseResponse> call({
    required String email,
    required String password,
  }) => loginRepo.login(email: email, password: password);
}
