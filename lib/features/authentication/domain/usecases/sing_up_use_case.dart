import 'package:ofoq/features/authentication/domain/entites/app_user.dart';
import 'package:ofoq/features/authentication/domain/repositories/auth_repository.dart';

class SingUpUseCase {
  final AuthRepository repository;

  SingUpUseCase(this.repository);

  Future<AppUser> execute({
    required String fullName,
    required String email,
    required String password,
  }) {
    return repository.signUp(
      fullName: fullName,
      email: email,
      password: password,
    );
  }
}
