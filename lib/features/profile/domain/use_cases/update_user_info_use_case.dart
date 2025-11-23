import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../entity/profile_entity.dart';
import '../repos/profile_repo_contract.dart';

@injectable
class UpdateUserInfoUsecase {
  const UpdateUserInfoUsecase(this._profileRepo);
  final ProfileRepoContract _profileRepo;
  Future<BaseResponse<ProfileEntity>> call(ProfileEntity profile) =>
      _profileRepo.updateUserProfile(profile.toJson());
}
