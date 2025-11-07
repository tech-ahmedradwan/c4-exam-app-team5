import '../../models/login_response/login_response.dart';

abstract class LoginRemoteDataSourceContract {
  Future<LoginResponse> login({
    required String email,
    required String password,
  });
}
