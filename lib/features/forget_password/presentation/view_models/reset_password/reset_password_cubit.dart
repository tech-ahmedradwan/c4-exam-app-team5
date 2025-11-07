import 'package:equatable/equatable.dart';

import '../../../../../config/base_state/base_state.dart';
import '../../../domain/entity/reset_password_entity.dart';
import '../../../domain/ucecases/reset_password_usecase.dart';
import 'reset_password_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'reset_password_state.dart';

@injectable
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this._resetPasswordUsecase)
    : super(const ResetPasswordState());
  final ResetPasswordUsecase _resetPasswordUsecase;
  void doIntent(ResetPasswordEvents event) {
    switch (event) {
      case ResetPasswordEvent():
        _resetPassword(email: event.email, newPassword: event.newPassword);
    }
  }

  _resetPassword({required String email, required String newPassword}) async {
    emit(
      state.copyWith(
        resetPasswordState: const BaseState<ResetPasswordEntity>(
          isLoading: true,
        ),
      ),
    );
    final result = await _resetPasswordUsecase(
      email: email,
      newPassword: newPassword,
    );
    result.when(
      onError: (error) => emit(
        state.copyWith(
          resetPasswordState: BaseState<ResetPasswordEntity>(
            errorMessage: error.message,
          ),
        ),
      ),
      onSuccess: (success) => emit(
        state.copyWith(
          resetPasswordState: BaseState<ResetPasswordEntity>(data: success),
        ),
      ),
    );
  }
}
