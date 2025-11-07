import 'package:injectable/injectable.dart';

import '../../../../../core/constants/api_endpoints/api_keys.dart';
import '../../../data/data_sources/remote/login_remote_data_source_contract.dart';
import '../../../data/models/login_response/login_response.dart';
import '../../api_client/login_api_client.dart';

@Injectable(as: LoginRemoteDataSourceContract)
class LoginRemoteDatasourceImpl extends LoginRemoteDataSourceContract {
  LoginRemoteDatasourceImpl({required this.loginApiClient});
  final LoginApiClient loginApiClient;
  @override
  Future<LoginResponse> login({
    required String email,
    required String password,
  }) {
    return loginApiClient.login({
      ApiKeys.email: email,
      ApiKeys.password: password,
    });
  }
}
