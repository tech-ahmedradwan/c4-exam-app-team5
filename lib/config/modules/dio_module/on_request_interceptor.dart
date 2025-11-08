import 'package:dio/dio.dart';
import '../../../core/constants/cache_keys/app_cache_keys.dart';
import '../../../core/services/local/app_storage/app_storage.dart';
import '../../di/di.dart';

class OnRequestInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['token'] = await getIt<AppStorage>().getSecure(
      AppCacheKeys.userTokenKey,
    );
    handler.next(options);
  }
}

// class AppErrorInterceptor extends Interceptor {
//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) {
//     final appException = _handleDioError(err);

//     // ✅ Instead of throw, use handler.reject()
//     handler.reject(
//       DioException(
//         requestOptions: err.requestOptions,
//         response: err.response,
//         type: err.type,
//         error: appException, // pass the AppException here
//         stackTrace: err.stackTrace,
//       ),
//     );
//   }
