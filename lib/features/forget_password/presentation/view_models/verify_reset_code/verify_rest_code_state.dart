part of 'verify_rest_code_cubit.dart';

class VerifyRestCodeState extends Equatable {
  const VerifyRestCodeState({
    this.verifyResetState = const BaseState<VerifyResetCodeEntity>(),
    this.resendCodeState = const BaseState<VerifyResetCodeEntity>(),
  });
  final BaseState<VerifyResetCodeEntity> verifyResetState;
  final BaseState<VerifyResetCodeEntity> resendCodeState;

  VerifyRestCodeState copyWith({
    BaseState<VerifyResetCodeEntity>? verifyResetState,
    BaseState<VerifyResetCodeEntity>? resendCodeState,
  }) => VerifyRestCodeState(
    verifyResetState: verifyResetState ?? this.verifyResetState,
    resendCodeState: resendCodeState ?? this.resendCodeState,
  );
  @override
  List<Object?> get props => [verifyResetState, resendCodeState];
}
