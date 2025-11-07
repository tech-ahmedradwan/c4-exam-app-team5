import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_endpoints/api_endpoints.dart';
import '../../data/models/login_response/login_response.dart';

part 'login_api_client.g.dart';

@LazySingleton()
@RestApi()
abstract class LoginApiClient {
  @factoryMethod
  factory LoginApiClient(Dio dio) = _LoginApiClient;

  @POST(ApiEndpoints.signInEndPoint)
  Future<LoginResponse> login(@Body() body);
}
