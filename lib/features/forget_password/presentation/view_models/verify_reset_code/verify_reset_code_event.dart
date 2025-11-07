sealed class VerifyResetCodeEvent {
  const VerifyResetCodeEvent();
}

class VerifyResetCode extends VerifyResetCodeEvent {
  const VerifyResetCode({required this.code});
  final String code;
}

class ResentCode extends VerifyResetCodeEvent {
  ResentCode({required this.email});
  final String email;
}
