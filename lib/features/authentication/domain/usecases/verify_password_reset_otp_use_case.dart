
import 'package:ofoq/features/authentication/domain/repositories/auth_repository.dart';

class VerifyPasswordResetOTPUseCase {
  final AuthRepository repository;

  VerifyPasswordResetOTPUseCase(this.repository);

  Future<void> execute({
    required String email,
    required String token,
  }) {
    return repository.verifyPasswordResetOTP(
      email: email,
      token: token,
    );
  }
}
