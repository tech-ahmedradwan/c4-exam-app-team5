import 'package:exam_app/config/base_response/base_response.dart';
import 'package:exam_app/core/errors/failure.dart';
import 'package:exam_app/features/login/domain/repos/login_repo_contract.dart';
import 'package:exam_app/features/login/domain/usecases/login_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_use_case_test.mocks.dart';

@GenerateMocks([LoginRepoContract])
void main() {
  late LoginUseCase loginUseCase;
  late MockLoginRepoContract mockLoginRepo;

  setUp(() {
    provideDummy<BaseResponse>(const SuccessResponse('dummy'));
    mockLoginRepo = MockLoginRepoContract();
    loginUseCase = LoginUseCase(loginRepo: mockLoginRepo);
  });

  group('LoginUseCase', () {
    const email = 'test@example.com';
    const password = 'password123';
    final successResponse = const SuccessResponse('success');
    final errorResponse = const ErrorResponse(ServerFailure('error'));

    test('should call login on repository with correct parameters', () async {
      // Arrange
      when(
        mockLoginRepo.login(email: email, password: password),
      ).thenAnswer((_) async => successResponse);

      // Act
      await loginUseCase(email: email, password: password);

      // Assert
      verify(mockLoginRepo.login(email: email, password: password)).called(1);
    });

    test('should return success response when login is successful', () async {
      // Arrange
      when(
        mockLoginRepo.login(email: email, password: password),
      ).thenAnswer((_) async => successResponse);

      // Act
      final result = await loginUseCase(email: email, password: password);

      // Assert
      expect(result, successResponse);
    });

    test('should return error response when login fails', () async {
      // Arrange
      when(
        mockLoginRepo.login(email: email, password: password),
      ).thenAnswer((_) async => errorResponse);

      // Act
      final result = await loginUseCase(email: email, password: password);

      // Assert
      expect(result, errorResponse);
    });
  });
}
