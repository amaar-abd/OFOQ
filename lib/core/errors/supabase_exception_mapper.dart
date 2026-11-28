import 'dart:async';
import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ofoq/core/errors/app_exception.dart';

class SupabaseExceptionMapper {

  static AppException map(Object error) {

    if (error is SocketException || error is TimeoutException) {
      return const AppException(AppErrorType.network);
    }

    if (error is AuthException) {
      return _mapAuthException(error);
    }

    return const AppException(AppErrorType.unknown);
  }

  static AppException _mapAuthException(AuthException error) {
    final code = error.code?.toLowerCase();

    switch (code) {
      case 'invalid_credentials':
        return const AppException(AppErrorType.invalidCredentials);

      case 'email_exists':
      case 'user_already_exists':
        return const AppException(AppErrorType.emailAlreadyInUse);

      case 'weak_password':
        return const AppException(AppErrorType.weakPassword);

      case 'invalid_email':
        return const AppException(AppErrorType.invalidEmail);

      case 'invalid_otp':
        return const AppException(AppErrorType.invalidOtp);

      case 'otp_expired':
      case 'token_expired':
        return const AppException(AppErrorType.expiredOtp);

      case 'user_not_found':
        return const AppException(AppErrorType.userNotFound);

      case 'over_request_rate_limit':
      case 'too_many_requests':
        return const AppException(AppErrorType.tooManyRequests);
    }

    if (error.statusCode == '429') {
      return const AppException(AppErrorType.tooManyRequests);
    }

    return const AppException(AppErrorType.unknown);
  }
}