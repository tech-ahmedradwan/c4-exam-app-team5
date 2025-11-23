part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  const ProfileState({
    this.changePasswordState = const BaseState<ChangePasswordEntity>(),
    this.userProfileState = const BaseState<ProfileEntity>(),
  });
  final BaseState<ChangePasswordEntity> changePasswordState;
  final BaseState<ProfileEntity> userProfileState;
  ProfileState copyWith({
    BaseState<ChangePasswordEntity>? changePasswordState,
    BaseState<ProfileEntity>? userProfileState,
  }) {
    return ProfileState(
      changePasswordState: changePasswordState ?? this.changePasswordState,
      userProfileState: userProfileState ?? this.userProfileState,
    );
  }

  @override
  List<Object> get props => [changePasswordState, userProfileState];
}
