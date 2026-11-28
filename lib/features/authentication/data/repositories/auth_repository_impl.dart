import 'package:ofoq/core/errors/app_exception.dart';
import 'package:ofoq/core/errors/supabase_exception_mapper.dart';
import 'package:ofoq/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:ofoq/features/authentication/domain/entites/app_user.dart';
import 'package:ofoq/features/authentication/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  
  Future<T> _execute<T>(Future<T> Function() action) async {
    try {
      return await action();
    } on AppException {
      rethrow;
    } catch (error) {
      throw SupabaseExceptionMapper.map(error);
    }
  }

  @override
  Future<AppUser> signUp({
    required String fullName,
    required String email,
    required String password,
  }) {
    return _execute(() async {
      final user = await remoteDataSource.signUp(
        fullName: fullName,
        email: email,
        password: password,
      );

      return AppUser(
        id: user.id,
        email: user.email,
        fullName: user.userMetadata?['full_name'] as String?,
      );
    });
  }

  @override
  Future<AppUser> signIn({required String email, required String password}) {
    return _execute(() async {
      final user = await remoteDataSource.signIn(
        email: email,
        password: password,
      );

      return AppUser(
        id: user.id,
        email: user.email,
        fullName: user.userMetadata?['full_name'] as String?,
      );
    });
  }

  @override
  Future<void> requestPasswordReset({required String email}) {
    return _execute(() async {
      await remoteDataSource.requestPasswordReset(email: email);
    });
  }

  @override
  Future<void> verifyPasswordResetOTP({
    required String email,
    required String token,
  }) {
    return _execute(() async {
      await remoteDataSource.verifyPasswordResetOTP(email: email, token: token);
    });
  }

  @override
  Future<void> updatePassword({required String newPassword}) {
    return _execute(() async {
      await remoteDataSource.updatePassword(newPassword: newPassword);
    });
  }

  @override
  Future<void> signOut() {
    return _execute(() async {
      await remoteDataSource.signOut();
    });
  }
}
