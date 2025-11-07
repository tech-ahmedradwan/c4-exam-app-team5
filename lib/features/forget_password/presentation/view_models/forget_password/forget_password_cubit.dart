import 'package:equatable/equatable.dart';

import '../../../../../config/base_state/base_state.dart';
import '../../../domain/entity/forget_password_entity.dart';
import '../../../domain/ucecases/forget_password_usecase.dart';
import 'forget_password_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
part 'forget_password_state.dart';

@injectable
class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this._forgetPasswordUsecase)
    : super(const ForgetPasswordState());
  final ForgetPasswordUsecase _forgetPasswordUsecase;

  void doIntety(ForgetPasswordEvents event) {
    switch (event) {
      case ForgetPassword():
        _forgetPassword(email: event.email);
    }
  }

  _forgetPassword({required String email}) async {
    emit(
      state.copyWith(
        forgetPasswordState: const BaseState<ForgetPasswordEntity>(
          isLoading: true,
        ),
      ),
    );
    final result = await _forgetPasswordUsecase(email: email);
    result.when(
      onError: (error) => emit(
        state.copyWith(
          forgetPasswordState: BaseState<ForgetPasswordEntity>(
            errorMessage: error.message,
          ),
        ),
      ),
      onSuccess: (success) => emit(
        state.copyWith(
          forgetPasswordState: BaseState<ForgetPasswordEntity>(data: success),
        ),
      ),
    );
  }
}
