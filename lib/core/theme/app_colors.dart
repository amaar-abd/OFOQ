import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF091B35);

  static const Color primaryDark = Color(0xFF061224);

  static const Color primaryLight = Color(0xFF142C52);

  static const Color accent = Color(0xFFD9A441);

  static const Color accentLight = Color(0xFFF3C76F);

  static const Color accentDark = Color(0xFFB58228);

  static const Color backgroundLight = Color(0xFFF4F6F9);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color cardHoverLight = Color(0xFFEDF1F7);

  static const Color textPrimaryLight = Color(0xFF091B35);
  static const Color textSecondaryLight = Color(0xFF64748B);
  static const Color textMutedLight = Color(0xFF94A3B8);

  static const Color borderLight = Color(0xFFE2E8F0);
  static const Color dividerLight = Color(0xFFEEF2F6);

  static const Color backgroundDark = Color(0xFF06101E);
  static const Color surfaceDark = Color(0xFF091B35);
  static const Color cardDark = Color(0xFF0F2647);
  static const Color cardElevatedDark = Color(0xFF163259);

  static const Color textPrimaryDark = Color(0xFFF8FAFC);
  static const Color textSecondaryDark = Color(0xFFCBD5E1);
  static const Color textMutedDark = Color(0xFF64748B);

  static const Color borderDark = Color(0xFF1E3A5F);
  static const Color dividerDark = Color(0xFF162D4A);

  static const Color statusHired = Color(0xFF10B981);

  static const Color statusReview = Color(0xFF3B82F6);

  static const Color statusInterview = Color(0xFFF59E0B);

  static const Color statusOffer = Color(0xFFD9A441);

  static const Color statusRejected = Color(0xFFEF4444);

  static const Color success = Color(0xFF10B981);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF2563EB);

  static const Color grey50 = Color(0xFFF8FAFC);
  static const Color grey100 = Color(0xFFF1F5F9);
  static const Color grey200 = Color(0xFFE2E8F0);
  static const Color grey300 = Color(0xFFCBD5E1);
  static const Color grey400 = Color(0xFF94A3B8);
  static const Color grey500 = Color(0xFF64748B);
  static const Color grey600 = Color(0xFF475569);
  static const Color grey700 = Color(0xFF334155);
  static const Color grey800 = Color(0xFF1E293B);
  static const Color grey900 = Color(0xFF0F172A);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF061224), Color(0xFF091B35), Color(0xFF142C52)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient goldGradient = LinearGradient(
    colors: [Color(0xFFF3C76F), Color(0xFFD9A441), Color(0xFFB58228)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  );

  static const LinearGradient cardDarkGradient = LinearGradient(
    colors: [Color(0xFF0F2647), Color(0xFF091B35)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient heroWaveGradient = LinearGradient(
    colors: [Color(0xFF091B35), Color(0xFF173259)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
