import 'package:ofoq/core/errors/app_exception.dart';
import 'package:ofoq/features/authentication/domain/entites/app_user.dart';

class AuthenticationState {
  final AppUser? user;
  final bool isLoading;
  final AppException? error;

  const AuthenticationState({
    this.user,
    this.isLoading = false,
    this.error,
  });

  AuthenticationState copyWith({
    AppUser? user,
    bool? isLoading,
    AppException? error,
    bool clearUser = false,
    bool clearError = false,
  }) {
    return AuthenticationState(
      user: clearUser ? null : user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : error ?? this.error,
    );
  }
}