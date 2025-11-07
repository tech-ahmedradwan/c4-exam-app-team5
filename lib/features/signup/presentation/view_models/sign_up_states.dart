part of 'sign_up_cubit.dart';

class SignUpStates extends Equatable {
  const SignUpStates({this.signupState = const BaseState<SignUpEntity>()});

  final BaseState<SignUpEntity> signupState;

  SignUpStates copyWith({BaseState<SignUpEntity>? signupState}) =>
      SignUpStates(signupState: signupState ?? this.signupState);
  @override
  List<Object?> get props => [signupState];
}
