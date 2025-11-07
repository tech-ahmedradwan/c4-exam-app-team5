import '../../domain/entities/user_entity.dart';

sealed class SignUpEvents {}

class SignUp extends SignUpEvents {
  SignUp({required this.user});
  final UserEntity user;
}
