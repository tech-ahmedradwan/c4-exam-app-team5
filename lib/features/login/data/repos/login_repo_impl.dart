import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../config/base_response/base_response.dart';
import '../../../../core/errors/app_exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repos/login_repo_contract.dart';
import '../data_sources/local/login_local_data_source_contract.dart';
import '../data_sources/remote/login_remote_data_source_contract.dart';

@Injectable(as: LoginRepoContract)
class LoginRepoImpl extends LoginRepoContract {
  LoginRepoImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });
  final LoginRemoteDataSourceContract remoteDataSource;
  final LoginLocalDataSourceContract localDataSource;
  @override
  Future<BaseResponse<LoginEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await remoteDataSource.login(
        email: email,
        password: password,
      );
      final entity = response.toEntity();
      await localDataSource.cacheLoginData(
        token: entity.token ?? '',
        userId: entity.id ?? '',
      );
      return SuccessResponse<LoginEntity>(entity);
    } on DioException catch (e) {
      if (e.error is AppException) {
        final appError = e.error as AppException;
        return ErrorResponse<LoginEntity>(ServerFailure(appError.message));
      }
      return const ErrorResponse(ServerFailure('Server error occurred.'));
    } catch (e) {
      log(e.toString());
      return const ErrorResponse<LoginEntity>(
        ServerFailure('An unexpected error occurred.'),
      );
    }
  }
}
