sealed class LoginEvents {}

class Login extends LoginEvents {
  Login({required this.email, required this.password});
  final String email;
  final String password;
}
