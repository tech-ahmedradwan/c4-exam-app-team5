import '../../../../config/base_response/base_response.dart';
import '../entity/change_pssword_entity.dart';
import '../entity/profile_entity.dart';

abstract class ProfileRepoContract {
  Future<BaseResponse<ProfileEntity>> getUserProfile();
  Future<BaseResponse<ProfileEntity>> updateUserProfile(
    Map<String, dynamic> updateData,
  );
  Future<BaseResponse<ChangePsswordEntity>> changeUserPassword(
    Map<String, dynamic> passwordData,
  );
}
