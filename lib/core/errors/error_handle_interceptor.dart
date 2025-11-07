import 'package:dio/dio.dart';

import 'app_exceptions.dart';

class AppErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final appException = _handleDioError(err);

    // ✅ Instead of throw, use handler.reject()
    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: appException, // pass the AppException here
        stackTrace: err.stackTrace,
      ),
    );
  }

  // The rest of the logic remains the same.
  AppException _handleDioError(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return AppException(
          message: 'Connection Timeout. Please check your internet connection.',
          statusCode: 408,
        );
      case DioExceptionType.badResponse:
        // ... (this logic is the same as before)
        return _handleBadResponse(err);
      case DioExceptionType.cancel:
        return AppException(message: 'Request was cancelled.');
      case DioExceptionType.connectionError:
        // This is the error you are currently getting due to the typo.
        return AppException(
          message: 'Connection Error: Failed to connect to the server.',
        );
      case DioExceptionType.unknown:
        return AppException(
          message: 'Connection Error: Failed to connect to the server.',
        );

      default:
        if (err.error is String) {
          return AppException(message: err.error.toString());
        }
        return AppException(message: 'An unexpected error occurred.');
    }
  }

  AppException _handleBadResponse(DioException err) {
    // This entire method remains unchanged.
    try {
      final responseData = err.response?.data as Map<String, dynamic>?;
      final serverMessage = responseData?['message'] ?? responseData?['error'];
      final statusCode = err.response?.statusCode;
      if (serverMessage != null) {
        return AppException(message: serverMessage, statusCode: statusCode);
      }
      switch (statusCode) {
        case 400:
          return AppException(message: 'Bad Request.', statusCode: statusCode);
        case 401:
          return AppException(
            message: 'Authentication failed.',
            statusCode: statusCode,
          );
        case 403:
          return AppException(
            message: 'Access denied.',
            statusCode: statusCode,
          );
        case 404:
          return AppException(
            message: 'Resource not found.',
            statusCode: statusCode,
          );
        case 500:
          return AppException(
            message: 'Internal server error.',
            statusCode: statusCode,
          );
        default:
          return AppException(
            message: 'Received an invalid status code: $statusCode',
            statusCode: statusCode,
          );
      }
    } catch (_) {
      return AppException(
        message: 'An unknown error occurred during response processing.',
      );
    }
  }
}
