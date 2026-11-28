import 'package:easy_localization/easy_localization.dart';
import 'package:ofoq/core/errors/app_exception.dart';

class ErrorMessageHandler {
  
  static String getMessage(Object error) {
    if (error is! AppException) {
      return 'errors.unknown'.tr();
    }

    switch (error.type) {
      case AppErrorType.network:
        return 'errors.network'.tr();

      case AppErrorType.invalidCredentials:
        return 'errors.invalid_credentials'.tr();

      case AppErrorType.emailAlreadyInUse:
        return 'errors.email_already_in_use'.tr();

      case AppErrorType.weakPassword:
        return 'errors.weak_password'.tr();

      case AppErrorType.invalidEmail:
        return 'errors.invalid_email'.tr();

      case AppErrorType.invalidOtp:
        return 'errors.invalid_otp'.tr();

      case AppErrorType.expiredOtp:
        return 'errors.expired_otp'.tr();

      case AppErrorType.userNotFound:
        return 'errors.user_not_found'.tr();

      case AppErrorType.tooManyRequests:
        return 'errors.too_many_requests'.tr();

      case AppErrorType.sessionExpired:
        return 'errors.session_expired'.tr();

      case AppErrorType.unknown:
        return 'errors.unknown'.tr();
    }
  }
}