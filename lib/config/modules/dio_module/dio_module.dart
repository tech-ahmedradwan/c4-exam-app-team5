import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../core/errors/error_handle_interceptor.dart';
import '../../../core/constants/api_endpoints/api_endpoints.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio dio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        responseType: ResponseType.json,
      ),
    );
    dio.interceptors.add(PrettyDioLogger());
    dio.interceptors.add(AppErrorInterceptor());

    return dio;
  }
}
