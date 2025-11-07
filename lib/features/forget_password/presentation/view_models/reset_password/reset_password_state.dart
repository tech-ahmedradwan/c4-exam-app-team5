part of 'reset_password_cubit.dart';

class ResetPasswordState extends Equatable {
  const ResetPasswordState({
    this.resetPasswordState = const BaseState<ResetPasswordEntity>(),
  });
  final BaseState<ResetPasswordEntity> resetPasswordState;

  ResetPasswordState copyWith({
    BaseState<ResetPasswordEntity>? resetPasswordState,
  }) => ResetPasswordState(
    resetPasswordState: resetPasswordState ?? this.resetPasswordState,
  );

  @override
  List<Object?> get props => [resetPasswordState];
}
