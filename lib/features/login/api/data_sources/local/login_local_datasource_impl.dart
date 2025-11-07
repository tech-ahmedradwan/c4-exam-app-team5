import 'package:injectable/injectable.dart';
import '../../../data/data_sources/local/login_local_data_source_contract.dart';
import '../../storage_client/login_local_store_client.dart';

@Injectable(as: LoginLocalDataSourceContract)
class LoginLocalDatasourceImpl implements LoginLocalDataSourceContract {
  LoginLocalDatasourceImpl(this._localStoreClient);
  final LoginLocalStoreClient _localStoreClient;
  @override
  Future<void> cacheLoginData({required String token, String? userId}) {
    return _localStoreClient.cacheLoginData(token: token, userId: userId);
  }
}
