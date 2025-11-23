import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../../core/constants/api_endpoints/api_endpoints.dart';
import '../../data/models/change_password_response/change_password_response.dart';
import '../../data/models/user_info_response/user_info_response.dart';

part 'profile_api_client.g.dart';

@LazySingleton()
@RestApi()
abstract class ProfileApiClient {
  @factoryMethod
  factory ProfileApiClient(Dio dio) = _ProfileApiClient;

  @GET(ApiEndpoints.profileEndPoint)
  Future<UserInfoResponse> getUserProfile();

  @PUT(ApiEndpoints.updateProfileEndPoint)
  Future<UserInfoResponse> updateUserProfile(
    @Body() Map<String, dynamic> updateData,
  );
  @PATCH(ApiEndpoints.changePasswordEndPoint)
  Future<ChangePasswordResponse> changePassword(
    @Body() Map<String, dynamic> passwordData,
  );
}
