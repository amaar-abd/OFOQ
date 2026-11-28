import 'package:ofoq/features/authentication/domain/entites/app_user.dart';
import 'package:ofoq/features/authentication/domain/repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<AppUser> execute({
    required String email,
    required String password,
  }) {
    return repository.signIn(
      email: email,
      password: password,
    );
  }
}
