import 'package:exam_app/features/login/api/data_sources/local/login_local_datasource_impl.dart';
import 'package:exam_app/features/login/api/storage_client/login_local_store_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_local_datasource_impl_test.mocks.dart';

@GenerateMocks([LoginLocalStoreClient])
void main() {
  late MockLoginLocalStoreClient loginLocalStoreClient;
  late LoginLocalDatasourceImpl loginLocalDatasourceImpl;
  setUpAll(() {
    loginLocalStoreClient = MockLoginLocalStoreClient();
    loginLocalDatasourceImpl = LoginLocalDatasourceImpl(loginLocalStoreClient);
  });
  test(
    'when call login cach local datasource with correct data it must cach it',
    () async {
      /// AAA -> Arrange, Act, Assert
      /// Arrange
      final token = 'testToken';
      final userId = 'testUserId';
      when(
        loginLocalStoreClient.cacheLoginData(token: token, userId: userId),
      );

      /// Act
      final result = loginLocalDatasourceImpl.cacheLoginData(
        token: token,
        userId: userId,
      );

      /// Assert
      expect(result, isA<Future<void>>());

      verify(
        loginLocalStoreClient.cacheLoginData(token: token, userId: userId),
      ).called(1);
      verifyNoMoreInteractions(loginLocalStoreClient);

      ///
    },
  );
}
