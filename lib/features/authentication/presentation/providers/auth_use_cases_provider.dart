import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ofoq/features/authentication/domain/usecases/request_password_reset_use_case.dart';
import 'package:ofoq/features/authentication/domain/usecases/sign_in_use_case.dart';
import 'package:ofoq/features/authentication/domain/usecases/sign_out_use_case.dart';
import 'package:ofoq/features/authentication/domain/usecases/sing_up_use_case.dart';
import 'package:ofoq/features/authentication/domain/usecases/update_password_use_case.dart';
import 'package:ofoq/features/authentication/domain/usecases/verify_password_reset_otp_use_case.dart';
import 'package:ofoq/features/authentication/presentation/providers/auth_repository_provider.dart';

final signUpUseCaseProvider = Provider<SingUpUseCase>((ref) {
  return SingUpUseCase(ref.watch(authRepositoryProvider));
});

final signInUseCaseProvider = Provider<SignInUseCase>((ref) {
  return SignInUseCase(ref.watch(authRepositoryProvider));
});

final requestPasswordResetUseCaseProvider =
    Provider<RequestPasswordResetUseCase>((ref) {
      return RequestPasswordResetUseCase(ref.watch(authRepositoryProvider));
    });

final verifyPasswordResetOTPUseCaseProvider =
    Provider<VerifyPasswordResetOTPUseCase>((ref) {
      return VerifyPasswordResetOTPUseCase(ref.watch(authRepositoryProvider));
    });

final updatePasswordUseCaseProvider = Provider<UpdatePasswordUseCase>((ref) {
  return UpdatePasswordUseCase(ref.watch(authRepositoryProvider));
});

final signOutUseCaseProvider = Provider<SignOutUseCase>((ref) {
  return SignOutUseCase(ref.watch(authRepositoryProvider));
});
