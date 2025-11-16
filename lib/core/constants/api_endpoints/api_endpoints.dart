class ApiEndpoints {
  ApiEndpoints._();
  //-------------------------------- BASE URL --------------------------------//
  static const String baseUrl = 'https://exam.elevateegy.com/api/v1/';
  //----------------------------- AUTH ENDPOINTS -----------------------------//
  static const String signInEndPoint = 'auth/signin';
  static const String kSignUpEndPoint = 'auth/signup';
  static const String forgetPasswordEndpoint = '/auth/forgotPassword';
  static const String verifyResetCodeEndPoint = '/auth/verifyResetCode';
  static const String resetPasswordEndPoint = '/auth/resetPassword';
  //--------------------------- EXPLORE ENDPOINTS ------------------------------//
  static const String exploreSubjectsEndPoint = 'subjects';
  //---------------------------- QUESTION ENDPOINTS -----------------------------//
  static const String questionsEndPoint = 'questions';
  //---------------------------- Exams ENDPOINTS -----------------------------//
  static const String subjectExamsEndPoint = 'exams';
}
