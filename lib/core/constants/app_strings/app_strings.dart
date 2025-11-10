abstract class AppStrings {
  AppStrings._();
  static const String appName = 'Exam App';

  //------------Sign In Feature-----------------
  static const String loginTitle = 'Login';
  static const String loginButton = 'Login';
  static const String signInSuccess = 'Login successfully.';

  // Sign In field labels and hints
  static const String rememberMe = 'Remember me';
  static const String forgetPassword = 'Forget password?';
  static const String dontHaveAccount = 'Don\'t have an account? ';

  //------------Sign Up Feature-----------------
  static const String signUpTitle = 'Sign Up';
  // Sign Up field labels and hints
  static const String fieldRequired = '{field} is required';
  static const String fieldInvalid = 'This {field} is not valid';

  static const String usernameLabel = 'User name';
  static const String usernameHint = 'Enter your user name';
  static const String usernameMin = 'User name must be at least 3 characters';

  static const String firstNameLabel = 'First name';
  static const String firstNameHint = 'Enter first name';
  static const String lastNameLabel = 'Last name';
  static const String lastNameHint = 'Enter last name';
  static const String firstNameShort = 'First name is too short';
  static const String lastNameShort = 'Last name is too short';

  static const String emailLabel = 'Email';
  static const String emailHint = 'Enter your email';

  static const String passwordLabel = 'Password';
  static const String passwordHint = 'Enter your password';
  static const String confirmPasswordLabel = 'Confirm password';
  static const String confirmPasswordHint = 'Confirm password';
  static const String passwordMin = 'Password min 8 chars';
  static const String passwordMismatch = 'Passwords do not match';

  static const String phoneNumberLabel = 'Phone number';
  static const String phoneNumberHint = 'Enter phone number';
  static const String alreadyHaveAccount = 'Already have an account? ';
  static const String signUpButton = 'Sign up';
  static const String signUpSuccess = 'User created successfully.';
  static const String signUpError = 'Sign up failed. Please try again.';

  //------------Password Requirements-----------------
  static const String passwordRequirementsTitle = 'Password must contain:';
  static const String passwordRequirementLength = '- At least 8 characters';
  static const String passwordRequirementUppercase =
      '- At least one uppercase letter';
  static const String passwordRequirementLowercase =
      '- At least one lowercase letter';
  static const String passwordRequirementNumber = '- At least one number';
  static const String passwordRequirementSpecialCharacter =
      '- At least one special character (e.g., !@#\$&*)';

  //------------Navigation----------------------
  // Error Builder
  static const String errorNavigate = 'Error When Navigate to route';
  //------------Home Layout ----------------------
  static const String explore = 'Explore';
  static const String result = 'Result';
  static const String profile = 'Profile';
  static const String exploreAppBar = 'Survey';
  static const String resultAppBar = 'Results';
  static const String profileAppBar = 'Profile';
  //------------Forget Password ------------------
  static const String password = 'password';
  static const String forgetPasswordDesc =
      'Please enter your email associated to your account';
  static const String continueLabel = 'Continue';
  static const String emailVerification = 'Email Verification';
  static const String emailVerificationDesc =
      ' Please enter your code that send to your email address';
  static const String invalidCode = 'Invalid code';
  static const String didntReceiveCode = "Didn't receive code? ";
  static const String resent = 'Resend';
  static const String resetPassword = 'Reset password';
  static const String resetPasswordDesc =
      'Password must not be empty and must contain 6 characters with upper case letter and one number at least ';

  //------------------- Show Toasts -------------------
  static const String loginSuccessToast = 'Welcome, Back';
  static const String otpSuccessToast =
      'Code Rest Scussessfull, Please check your mail';
  static const String resetPasswordSuccessToast = 'Password Reset Successfully';
  static const String resentCodeToast = 'Otp Resend Successfully';
  static const String loading = 'Loading...';
  static const String codeVerifiedSuccessToast = 'Code Verified Successfully';

  //------------------ Explore --------------
  static const String browseBySubject = 'Browse by subject';
}
