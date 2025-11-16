part of 'login_cubit.dart';

class LoginStates extends Equatable {
  const LoginStates({this.loginState = const BaseState<LoginEntity>()});
  final BaseState<LoginEntity> loginState;

  LoginStates copyWith({BaseState<LoginEntity>? loginState}) {
    return LoginStates(loginState: loginState ?? this.loginState);
  }

  @override
  List<Object?> get props => [loginState];
}
