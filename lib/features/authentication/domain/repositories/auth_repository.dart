import 'package:ofoq/features/authentication/domain/entites/app_user.dart';

abstract class AuthRepository {
  Future<AppUser> signUp({
    required String fullName,
    required String email,
    required String password,
  });

  Future<AppUser> signIn({
    required String email,
    required String password,
  });

  Future<void> requestPasswordReset({
    required String email,
  });

  Future<void> verifyPasswordResetOTP({
    required String email,
    required String token,
  });

  Future<void> updatePassword({
    required String newPassword,
  });

  Future<void> signOut();
}
