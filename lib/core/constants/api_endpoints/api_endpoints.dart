class ApiEndpoints {
  ApiEndpoints._();
  static const String baseUrl = 'https://exam.elevateegy.com/api/v1/';
  static const String signInEndPoint = 'auth/signin';
  static const String kSignUpEndPoint = 'auth/signup';
  static const String forgetPasswordEndpoint = '/auth/forgotPassword';
  static const String verifyResetCodeEndPoint = '/auth/verifyResetCode';
  static const String resetPasswordEndPoint = '/auth/resetPassword';
}
