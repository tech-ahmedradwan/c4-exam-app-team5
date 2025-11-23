import 'package:injectable/injectable.dart';

import '../../../../config/base_response/base_response.dart';
import '../../data/models/chnage_pssword_dto/change_password_dto.dart';
import '../entity/change_pssword_entity.dart';
import '../repos/profile_repo_contract.dart';

@injectable
class ChangePassowrdUsecase {
  const ChangePassowrdUsecase(this._profileRepo);
  final ProfileRepoContract _profileRepo;
  Future<BaseResponse<ChangePsswordEntity>> call({
    required ChangePasswordDto passwordData,
  }) => _profileRepo.changeUserPassword(passwordData.toJson());
}
