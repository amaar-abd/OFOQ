
import 'package:ofoq/features/authentication/domain/repositories/auth_repository.dart';

class RequestPasswordResetUseCase {
  final AuthRepository repository;

  RequestPasswordResetUseCase(this.repository);

  Future<void> execute({
    required String email,
  }) {
    return repository.requestPasswordReset(email: email);
  }
}
