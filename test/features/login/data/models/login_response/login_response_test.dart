import 'package:exam_app/features/login/data/models/login_response/login_response.dart';
import 'package:exam_app/features/login/data/models/login_response/user.dart';
import 'package:exam_app/features/login/domain/entities/login_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late LoginResponse loginResponse;
  setUpAll(() {
    loginResponse = LoginResponse();
  });
  group(
    'call loginResponse toEntity with 2 tests which are null value and non-null value',
    () {
      test('call toEntity with null value expext to return null object', () {
        /// AAA
        /// arrange
        loginResponse = LoginResponse(token: null, user: null, message: null);
        final result = loginResponse.toEntity();
        expect(result, isA<LoginEntity>());
        expect(result.id, equals(loginResponse.user?.id));
        expect(result.token, equals(loginResponse.token));
      });

      test(
        'call toEntity with non null value expext to return valuable object',
        () {
          /// AAA
          /// arrange
          loginResponse = LoginResponse(
            token: 'token',
            user: User(username: 'ahmed'),
            message: 'message',
          );
          final result = loginResponse.toEntity();
          expect(result, isA<LoginEntity>());
          expect(result.id, equals(loginResponse.user?.id));
          expect(result.token, equals(loginResponse.token));
        },
      );
    },
  );
}
