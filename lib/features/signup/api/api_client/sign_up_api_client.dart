import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_endpoints/api_endpoints.dart';
import '../../data/models/sign_up_response/sign/sign_up_response.dart';

part 'sign_up_api_client.g.dart';

@LazySingleton()
@RestApi()
abstract class SignUpApiClient {
  @factoryMethod
  factory SignUpApiClient(Dio dio) = _SignUpApiClient;

  @POST(ApiEndpoints.kSignUpEndPoint)
  Future<SignUpResponse> signUp(@Body() body);
}
