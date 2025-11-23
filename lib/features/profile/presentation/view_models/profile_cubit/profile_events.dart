import '../../../data/models/chnage_pssword_dto/change_password_dto.dart';
import '../../../data/models/user_info_response/user.dart';

sealed class ProfileEvents {}

final class LoadUserProfile extends ProfileEvents {}

final class UpdateUserProfile extends ProfileEvents {
  UpdateUserProfile({required this.userProfile});

  final UserProfileDto userProfile;
}

final class ChangeUserPassword extends ProfileEvents {
  ChangeUserPassword({required this.changeUserPassword});
  final ChangePasswordDto changeUserPassword;
}
