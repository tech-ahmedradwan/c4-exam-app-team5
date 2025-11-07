import 'package:injectable/injectable.dart';

import '../../../../core/constants/cache_keys/app_cache_keys.dart';
import '../../../../core/services/local/app_storage/app_storage.dart';

@injectable
class LoginLocalStoreClient {
  LoginLocalStoreClient(this._secureStorage);

  final AppStorage _secureStorage;

  Future<void> cacheLoginData({required String token, String? userId}) async {
    await _secureStorage.saveSecure(AppCacheKeys.userTokenKey, token);
    if (userId != null) {
      await _secureStorage.saveSecure(AppCacheKeys.userIdKey, userId);
    }
  }
}
