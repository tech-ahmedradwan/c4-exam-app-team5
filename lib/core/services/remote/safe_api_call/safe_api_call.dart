import 'package:dio/dio.dart';
import '../../../../config/base_response/base_response.dart';
import '../../../errors/app_exceptions.dart';
import '../../../errors/failure.dart';

Future<BaseResponse<T>> safeApiCall<T>(Future<T> Function() apiCall) async {
  try {
    final result = await apiCall();
    return SuccessResponse(result);
  } on DioException catch (e) {
    if (e.error is AppException) {
      final appError = e.error as AppException;
      return ErrorResponse(ServerFailure(appError.message));
    }
    return const ErrorResponse(ServerFailure('Server error occurred.'));
  } catch (e) {
    return const ErrorResponse(ServerFailure('An unexpected error occurred.'));
  }
}
