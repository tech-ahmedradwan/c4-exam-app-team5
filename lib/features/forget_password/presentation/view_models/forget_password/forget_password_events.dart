sealed class ForgetPasswordEvents {
  const ForgetPasswordEvents();
}

class ForgetPassword extends ForgetPasswordEvents {
  const ForgetPassword(this.email);
  final String email;
}
