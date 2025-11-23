import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/base_state/base_state.dart';
import '../../../data/models/chnage_pssword_dto/change_password_dto.dart';
import '../../../data/models/user_info_response/user.dart';
import '../../../domain/entity/change_pssword_entity.dart';
import '../../../domain/entity/profile_entity.dart';
import '../../../domain/use_cases/change_passowrd_usecase.dart';
import '../../../domain/use_cases/get_user_info_usecase.dart';
import '../../../domain/use_cases/update_user_info_use_case.dart';
import 'profile_events.dart';

part 'profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
    this._changePassowrdUsecase,
    this._getUserInfoUsecase,
    this._updateUserInfoUsecase,
  ) : super(const ProfileState());
  final ChangePassowrdUsecase _changePassowrdUsecase;
  final GetUserInfoUsecase _getUserInfoUsecase;
  final UpdateUserInfoUsecase _updateUserInfoUsecase;

  void doIntent(ProfileEvents event) {
    switch (event) {
      case LoadUserProfile():
        _getUserProfile();
        throw UnimplementedError();
      case UpdateUserProfile():
        _chageUserProfile(event.userProfile);
      case ChangeUserPassword():
        _changeUserPassword(event.changeUserPassword);
    }
  }

  _changeUserPassword(ChangePasswordDto passwordData) async {
    emit(
      state.copyWith(
        changePasswordState: state.changePasswordState.copyWith(
          isLoading: true,
        ),
      ),
    );
    final response = await _changePassowrdUsecase(passwordData: passwordData);
    response.when(
      onSuccess: (data) {
        emit(
          state.copyWith(
            changePasswordState: state.changePasswordState.copyWith(
              isLoading: false,
              data: data,
            ),
          ),
        );
      },
      onError: (failure) {
        emit(
          state.copyWith(
            changePasswordState: state.changePasswordState.copyWith(
              isLoading: false,
              errorMessage: failure.message,
            ),
          ),
        );
      },
    );
  }

  _getUserProfile() async {
    emit(
      state.copyWith(
        userProfileState: state.userProfileState.copyWith(isLoading: true),
      ),
    );
    final response = await _getUserInfoUsecase();
    response.when(
      onSuccess: (data) {
        emit(
          state.copyWith(
            userProfileState: state.userProfileState.copyWith(
              isLoading: false,
              data: data,
            ),
          ),
        );
      },
      onError: (failure) {
        emit(
          state.copyWith(
            userProfileState: state.userProfileState.copyWith(
              isLoading: false,
              errorMessage: failure.message,
            ),
          ),
        );
      },
    );
  }

  _chageUserProfile(UserProfileDto userProfileData) async {
    emit(
      state.copyWith(
        userProfileState: state.userProfileState.copyWith(isLoading: true),
      ),
    );
    final response = await _updateUserInfoUsecase(userProfileData.toEntity());
    response.when(
      onSuccess: (data) {
        emit(
          state.copyWith(
            userProfileState: state.userProfileState.copyWith(
              isLoading: false,
              data: data,
            ),
          ),
        );
      },
      onError: (failure) {
        emit(
          state.copyWith(
            userProfileState: state.userProfileState.copyWith(
              isLoading: false,
              errorMessage: failure.message,
            ),
          ),
        );
      },
    );
  }
}
