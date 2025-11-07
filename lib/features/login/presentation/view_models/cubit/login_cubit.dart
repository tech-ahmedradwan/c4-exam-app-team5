import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../config/base_state/base_state.dart';
import '../../../domain/entities/login_entity.dart';
import '../../../domain/usecases/login_use_case.dart';
import 'login_events.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this._loginUseCase) : super(const LoginStates());
  final LoginUseCase _loginUseCase;

  void doIntent(LoginEvents event) {
    switch (event) {
      case Login():
        _login(email: event.email, password: event.password);
    }
  }

  void _login({required String email, required String password}) async {
    emit(
      state.copyWith(loginState: const BaseState<LoginEntity>(isLoading: true)),
    );
    final result = await _loginUseCase(email: email, password: password);
    result.when(
      onSuccess: (success) => emit(
        state.copyWith(loginState: BaseState<LoginEntity>(data: success)),
      ),
      onError: (error) => emit(
        state.copyWith(
          loginState: BaseState<LoginEntity>(errorMessage: error.message),
        ),
      ),
    );
  }
}
