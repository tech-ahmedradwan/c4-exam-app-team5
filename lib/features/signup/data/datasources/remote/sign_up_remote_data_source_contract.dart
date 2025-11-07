import '../../../domain/entities/user_entity.dart';
import '../../models/sign_up_response/sign/sign_up_response.dart';

abstract class SignUpRemoteDataSourceContract {
  Future<SignUpResponse> signUp({required UserEntity user});
}
