part of 'forget_password_cubit.dart';

class ForgetPasswordState extends Equatable {
  const ForgetPasswordState({
    this.forgetPasswordState = const BaseState<ForgetPasswordEntity>(),
  });
  final BaseState<ForgetPasswordEntity> forgetPasswordState;

  ForgetPasswordState copyWith({
    BaseState<ForgetPasswordEntity>? forgetPasswordState,
  }) => ForgetPasswordState(
    forgetPasswordState: forgetPasswordState ?? this.forgetPasswordState,
  );

  @override
  List<Object?> get props => [forgetPasswordState];
}
