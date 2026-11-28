import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRemoteDataSource {
  final SupabaseClient client;

  AuthRemoteDataSource(this.client);

  Future<User> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    final response = await client.auth.signUp(
      email: email,
      password: password,
      data: {'full_name': fullName},
    );

    final user = response.user;

    if (user == null) {
      throw const AuthException('User creation failed.');
    }

    return user;
  }

  Future<User> signIn({required String email, required String password}) async {
    final response = await client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    final user = response.user;

    if (user == null) {
      throw const AuthException('Login failed.');
    }

    return user;
  }

  Future<void> requestPasswordReset({required String email}) async {
    await client.auth.resetPasswordForEmail(email);
  }

  Future<void> verifyPasswordResetOTP({
    required String email,
    required String token,
  }) async {
    await client.auth.verifyOTP(
      type: OtpType.recovery,
      email: email,
      token: token,
    );
  }

  Future<void> updatePassword({required String newPassword}) async {
    await client.auth.updateUser(UserAttributes(password: newPassword));
  }

  Future<void> signOut() async {
    await client.auth.signOut();
  }
}
