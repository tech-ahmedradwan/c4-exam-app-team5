import '../../../../config/base_response/base_response.dart';

abstract class LoginRepoContract {
  Future<BaseResponse> login({required String email, required String password});
}
