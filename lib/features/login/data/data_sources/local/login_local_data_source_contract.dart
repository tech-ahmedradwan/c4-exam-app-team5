abstract class LoginLocalDataSourceContract {
  Future<void> cacheLoginData({required String token, required String userId});
}
