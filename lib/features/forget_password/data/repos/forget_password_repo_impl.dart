import 'dart:developer';
import 'package:dio/dio.dart';
import '../../../../config/base_response/base_response.dart';
import '../../domain/entity/forget_password_entity.dart';
import '../../domain/entity/reset_password_entity.dart';
import '../../domain/entity/verify_reset_code_entity.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/app_exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repos/forget_password_repo_contract.dart';
import '../data_sources/remote/remote_data_source_cont.dart';

@Injectable(as: ForgetPasswordRepoContract)
class ForgetPasswordRepoImpl extends ForgetPasswordRepoContract {
  ForgetPasswordRepoImpl({required this.remoteDataSource});
  final ForgetPasswordRemoteDataSourceContract remoteDataSource;

  @override
  Future<BaseResponse<ForgetPasswordEntity>> forgetPassword({
    required String email,
  }) async {
    try {
      final response = await remoteDataSource.forgetPassword(email);

      return SuccessResponse(response.toEntity());
    } on DioException catch (e) {
      if (e.error is AppException) {
        final appError = e.error as AppException;
        return ErrorResponse(ServerFailure(appError.message));
      }
      return const ErrorResponse(ServerFailure('Network error occurred.'));
    } catch (e) {
      log(e.toString());
      return const ErrorResponse(ServerFailure('Unexpected error occurred.'));
    }
  }

  @override
  Future<BaseResponse<ResetPasswordEntity>> resetPassword({
    required String email,
    required String newPassword,
  }) async {
    try {
      final response = await remoteDataSource.resetPassword(email, newPassword);

      return SuccessResponse(response.toEntity());
    } on DioException catch (e) {
      if (e.error is AppException) {
        final appError = e.error as AppException;
        return ErrorResponse(ServerFailure(appError.message));
      }
      return const ErrorResponse(ServerFailure('Network error occurred.'));
    } catch (e) {
      return const ErrorResponse(ServerFailure('Unexpected error occurred.'));
    }
  }

  @override
  Future<BaseResponse<VerifyResetCodeEntity>> verifyResetCode({
    required String resetCode,
  }) async {
    try {
      final response = await remoteDataSource.verifyResetCode(resetCode);

      return SuccessResponse(response.toEntity());
    } on DioException catch (e) {
      if (e.error is AppException) {
        final appError = e.error as AppException;
        return ErrorResponse(ServerFailure(appError.message));
      }
      return const ErrorResponse(ServerFailure('Network error occurred.'));
    } catch (e) {
      log(e.toString());
      return const ErrorResponse(ServerFailure('Unexpected error occurred.'));
    }
  }
}
