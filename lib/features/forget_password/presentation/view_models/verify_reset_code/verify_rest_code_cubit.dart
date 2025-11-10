import 'package:equatable/equatable.dart';

import '../../../../../config/base_state/base_state.dart';
import '../../../domain/entity/verify_reset_code_entity.dart';
import '../../../domain/ucecases/verify_reset_otp_usecase.dart';
import 'verify_reset_code_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../config/di/di.dart';
import '../forget_password/forget_password_cubit.dart';
import '../forget_password/forget_password_events.dart';

part 'verify_rest_code_state.dart';

@injectable
class VerifyRestCodeCubit extends Cubit<VerifyRestCodeState> {
  VerifyRestCodeCubit(this._otpUsecase) : super(const VerifyRestCodeState());
  bool isValidate = false;

  final VerifyResetOtpUsecase _otpUsecase;
  doIntent(VerifyResetCodeEvent event) {
    switch (event) {
      case VerifyResetCode():
        _verifyCode(code: event.code);
      case ResentCode():
        _resentCode(email: event.email);
    }
  }

  _resentCode({required String email}) {
    emit(
      state.copyWith(
        resendCodeState: const BaseState<VerifyResetCodeEntity>(
          isLoading: true,
        ),
      ),
    );
    getIt<ForgetPasswordCubit>().doIntety(ForgetPassword(email));
    emit(
      state.copyWith(
        resendCodeState: const BaseState<VerifyResetCodeEntity>(
          data: VerifyResetCodeEntity(status: 'Code resent successfully'),
        ),
      ),
    );
  }

  _verifyCode({required String code}) async {
    emit(
      state.copyWith(
        verifyResetState: const BaseState<VerifyResetCodeEntity>(
          isLoading: true,
        ),
      ),
    );
    final response = await _otpUsecase(code: code);
    response.when(
      onError: (error) {
        isValidate = false;
        emit(
          state.copyWith(
            verifyResetState: BaseState<VerifyResetCodeEntity>(
              errorMessage: error.message,
            ),
          ),
        );
      },
      onSuccess: (success) {
        isValidate = true;
        emit(
          state.copyWith(
            verifyResetState: BaseState<VerifyResetCodeEntity>(data: success),
          ),
        );
      },
    );
  }
}
