import 'package:exam_app/features/login/api/api_client/login_api_client.dart';
import 'package:exam_app/features/login/api/data_sources/remote/login_remote_datasource_impl.dart';
import 'package:exam_app/features/login/data/models/login_response/login_response.dart';
import 'package:exam_app/features/login/data/models/login_response/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_remote_datasource_impl_test.mocks.dart';

@GenerateMocks([LoginApiClient])
void main() {
  late LoginRemoteDatasourceImpl loginRemoteDataSource;
  setUpAll(() {
    loginRemoteDataSource = LoginRemoteDatasourceImpl(
      loginApiClient: MockLoginApiClient(),
    );
  });

  test(
    'when call login remote datasource impl return success it shoud return a data',
    () async {
      final LoginResponse loginResponse = LoginResponse(
        message: 'message',
        token: 'token',
        user: User(username: 'ahmed'),
      );
      when(
        loginRemoteDataSource.login(email: 'e', password: 'p'),
      ).thenAnswer((answer) => Future.value(loginResponse));
      final result = await loginRemoteDataSource.login(
        email: 'e',
        password: 'p',
      );
      expect(result, isA<LoginResponse>());
      expect(result.token, loginResponse.token);
      expect(result.user, loginResponse.user);
    },
  );
}
