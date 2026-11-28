import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ofoq/core/errors/app_exception.dart';
import 'package:ofoq/features/authentication/presentation/providers/auth_use_cases_provider.dart';
import 'package:ofoq/features/authentication/presentation/states/authentication_state.dart';

class AuthenticationNotifier extends Notifier<AuthenticationState> {
  @override
  AuthenticationState build() {
    return const AuthenticationState();
  }

  Future<void> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final userCase = ref.read(signUpUseCaseProvider);

      final user = await userCase.execute(
        fullName: fullName,
        email: email,
        password: password,
      );
      state = state.copyWith(user: user, isLoading: false);
    } on AppException catch (error) {
      state = state.copyWith(isLoading: false, error: error);
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      final useCase = ref.read(signInUseCaseProvider);

      final user = await useCase.execute(email: email, password: password);

      state = state.copyWith(user: user, isLoading: false);
    } on AppException catch (error) {
      state = state.copyWith(isLoading: false, error: error);
    }
  }

  Future<void> requestPasswordReset({required String email}) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      await ref.read(requestPasswordResetUseCaseProvider).execute(email: email);

      state = state.copyWith(isLoading: false);
    } on AppException catch (error) {
      state = state.copyWith(isLoading: false, error: error);
    }
  }

  Future<void> verifyPasswordResetOTP({
    required String email,
    required String token,
  }) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      await ref
          .read(verifyPasswordResetOTPUseCaseProvider)
          .execute(email: email, token: token);

      state = state.copyWith(isLoading: false);
    } on AppException catch (error) {
      state = state.copyWith(isLoading: false, error: error);
    }
  }

  Future<void> updatePassword({required String newPassword}) async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      await ref
          .read(updatePasswordUseCaseProvider)
          .execute(newPassword: newPassword);

      state = state.copyWith(isLoading: false);
    } on AppException catch (error) {
      state = state.copyWith(isLoading: false, error: error);
    }
  }

  Future<void> signOut() async {
    state = state.copyWith(isLoading: true, clearError: true);

    try {
      await ref.read(signOutUseCaseProvider).execute();

      state = const AuthenticationState();
    } on AppException catch (error) {
      state = state.copyWith(isLoading: false, error: error);
    }
  }

  void clearError() {
    state = state.copyWith(clearError: true);
  }
}
