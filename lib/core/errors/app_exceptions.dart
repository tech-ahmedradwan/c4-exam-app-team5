import 'package:dio/dio.dart';

class AppException implements Exception {
  AppException({required this.message, this.statusCode});
  final String message;
  final int? statusCode;

  @override
  String toString() => 'AppException: $message';
}

class DioExceptions implements Exception {
  DioExceptions.fromError(dynamic error) {
    if (error is DioException) {
      _handleDioError(error);
    } else {
      message = 'Failed to parse data';
    }
  }
  String message = '';

  AppException _handleDioError(DioException err) {
    // ✅ If Dio has a response, treat it as badResponse, even if type is unknown
    if (err.response != null) {
      return _handleBadResponse(err);
    }

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return AppException(
          message: 'Connection Timeout. Please check your internet connection.',
          statusCode: 408,
        );
      case DioExceptionType.cancel:
        return AppException(message: 'Request was cancelled.');
      case DioExceptionType.connectionError:
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
    try {
      final responseData = err.response?.data;

      // ✅ Handle if responseData is a string instead of a map
      if (responseData is String) {
        return AppException(message: responseData);
      }

      final Map<String, dynamic>? json = responseData is Map<String, dynamic>
          ? responseData
          : null;

      final serverMessage = json?['message'] ?? json?['error'];
      final statusCode = err.response?.statusCode;

      if (serverMessage != null) {
        return AppException(message: serverMessage, statusCode: statusCode);
      }

      switch (statusCode) {
        case 400:
          return AppException(message: 'Bad Request.', statusCode: statusCode);
        case 401:
          return AppException(message: 'Unauthorized.', statusCode: statusCode);
        case 403:
          return AppException(message: 'Forbidden.', statusCode: statusCode);
        case 404:
          return AppException(message: 'Not Found.', statusCode: statusCode);
        case 500:
          return AppException(message: 'Server Error.', statusCode: statusCode);
        default:
          return AppException(
            message: 'Error: ${statusCode ?? 'unknown'}',
            statusCode: statusCode,
          );
      }
    } catch (e) {
      return AppException(message: 'Error parsing server response.');
    }
  }

  @override
  String toString() => message;
}
