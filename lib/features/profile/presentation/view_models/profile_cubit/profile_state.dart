part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.changePasswordState = const BaseState<ChangePasswordEntity>(),
    this.userProfileState = const BaseState<ProfileEntity>(),
    this.updateProfileState = const BaseState<ProfileEntity>(),
  });
  final BaseState<ChangePasswordEntity> changePasswordState;
  final BaseState<ProfileEntity> userProfileState;
  final BaseState<ProfileEntity> updateProfileState;
  ProfileState copyWith({
    BaseState<ChangePasswordEntity>? changePasswordState,
    BaseState<ProfileEntity>? userProfileState,
    BaseState<ProfileEntity>? updateProfileState,
  }) {
    return ProfileState(
      changePasswordState: changePasswordState ?? this.changePasswordState,
      userProfileState: userProfileState ?? this.userProfileState,
      updateProfileState: updateProfileState ?? this.updateProfileState,
    );
  }

  @override
  List<Object> get props => [
    changePasswordState,
    userProfileState,
    updateProfileState,
  ];
}
