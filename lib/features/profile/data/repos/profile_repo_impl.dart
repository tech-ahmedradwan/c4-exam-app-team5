import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../config/base_response/base_response.dart';
import '../../../../core/errors/app_exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entity/change_pssword_entity.dart';
import '../../domain/entity/profile_entity.dart';
import '../../domain/repos/profile_repo_contract.dart';
import '../data_source/profile_remote_data_source/profile_remote_data_source_contract.dart';

@Injectable(as: ProfileRepoContract)
class ProfileRepoImpl implements ProfileRepoContract {
  const ProfileRepoImpl(this._remoteDataSource);
  final ProfileRemoteDataSourceContract _remoteDataSource;
  @override
  Future<BaseResponse<ChangePsswordEntity>> changeUserPassword(
    Map<String, dynamic> passwordData,
  ) async {
    try {
      final response = await _remoteDataSource.changePassword(passwordData);
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
  Future<BaseResponse<ProfileEntity>> getUserProfile() async {
    try {
      final response = await _remoteDataSource.getUserProfile();
      return SuccessResponse(response.user!.toEntity());
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
  Future<BaseResponse<ProfileEntity>> updateUserProfile(
    Map<String, dynamic> updateData,
  ) async {
    try {
      final response = await _remoteDataSource.updateUserProfile(updateData);
      return SuccessResponse(response.user!.toEntity());
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
}
