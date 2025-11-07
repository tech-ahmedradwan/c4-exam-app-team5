import 'package:dio/dio.dart';
import '../../data/models/reset_password_response/reset_password_response.dart';
import '../../data/models/verify_reset_code_response/verify_reset_code_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/constants/api_endpoints/api_endpoints.dart';
import '../../data/models/forget_password_response/forget_password_response.dart';

part 'forget_password_api_client.g.dart';

@LazySingleton()
@RestApi()
abstract class ForgetPasswordApiClient {
  @factoryMethod
  factory ForgetPasswordApiClient(Dio dio) = _ForgetPasswordApiClient;

  @POST(ApiEndpoints.forgetPasswordEndpoint)
  Future<ForgetPasswordResponse> forgetPassword(@Body() body);

  @POST(ApiEndpoints.verifyResetCodeEndPoint)
  Future<VerifyResetCodeResponse> verifyResetCode(@Body() body);

  @PUT(ApiEndpoints.resetPasswordEndPoint)
  Future<ResetPasswordResponse> resetPassword(@Body() body);
}
