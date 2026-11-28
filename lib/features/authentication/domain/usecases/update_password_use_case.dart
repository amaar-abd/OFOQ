
import 'package:ofoq/features/authentication/domain/repositories/auth_repository.dart';

class UpdatePasswordUseCase {
  final AuthRepository repository;

  UpdatePasswordUseCase(this.repository);

  Future<void> execute({
    required String newPassword,
  }) {
    return repository.updatePassword(
      newPassword: newPassword,
    );
  }
}
