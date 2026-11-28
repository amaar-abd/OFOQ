enum AppErrorType {
  network,
  invalidCredentials,
  emailAlreadyInUse,
  weakPassword,
  invalidEmail,
  invalidOtp,
  expiredOtp,
  userNotFound,
  tooManyRequests,
  sessionExpired,
  unknown,
}

class AppException implements Exception {
  final AppErrorType type;

  const AppException(this.type);
}