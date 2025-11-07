import '../../../../config/base_response/base_response.dart';
import '../entities/sign_up_entity.dart';
import '../entities/user_entity.dart';

abstract interface class SignUpRepoContract {
  Future<BaseResponse<SignUpEntity>> signUp({required UserEntity user});
}
