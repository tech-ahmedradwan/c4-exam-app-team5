import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../config/base_state/base_state.dart';
import '../../domain/entities/sign_up_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/sign_up_use_case.dart';
import 'sign_up_events.dart';
part 'sign_up_states.dart';

@injectable
class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit(this._signUpUseCase) : super(const SignUpStates());
  final SignUpUseCase _signUpUseCase;

  void doIntent(SignUpEvents event) {
    switch (event) {
      case SignUp():
        _signUp(user: event.user);
    }
  }

  void _signUp({required UserEntity user}) async {
    emit(
      state.copyWith(
        signupState: const BaseState<SignUpEntity>().copyWith(isLoading: true),
      ),
    );
    final result = await _signUpUseCase(user: user);
    result.when(
      onError: (error) => emit(
        state.copyWith(
          signupState: BaseState<SignUpEntity>(errorMessage: error.message),
        ),
      ),
      onSuccess: (success) => emit(
        state.copyWith(signupState: BaseState<SignUpEntity>(data: success)),
      ),
    );
  }
}
