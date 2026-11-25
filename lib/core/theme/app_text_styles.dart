import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class AppFontFamilies {
  static const String arabic = 'IBMPlexSansArabic';
  static const String english = 'PlusJakartaSans';

  static String get current {
    final languageCode = Intl.getCurrentLocale().split('_').first;
    return languageCode == 'ar' ? arabic : english;
  }
}

class AppTextStyles {
  static TextStyle get displayLarge =>
      _style(fontSize: 34, fontWeight: FontWeight.w700, height: 1.25);

  static TextStyle get displayMedium =>
      _style(fontSize: 30, fontWeight: FontWeight.w700, height: 1.25);

  static TextStyle get headlineLarge =>
      _style(fontSize: 26, fontWeight: FontWeight.w700, height: 1.3);

  static TextStyle get headlineMedium =>
      _style(fontSize: 22, fontWeight: FontWeight.w700, height: 1.3);

  static TextStyle get headlineSmall =>
      _style(fontSize: 19, fontWeight: FontWeight.w700, height: 1.3);

  static TextStyle get titleLarge =>
      _style(fontSize: 17, fontWeight: FontWeight.w600, height: 1.35);

  static TextStyle get titleMedium =>
      _style(fontSize: 15, fontWeight: FontWeight.w600, height: 1.35);

  static TextStyle get titleSmall =>
      _style(fontSize: 13, fontWeight: FontWeight.w600, height: 1.35);

  static TextStyle get bodyLarge =>
      _style(fontSize: 15, fontWeight: FontWeight.w400, height: 1.5);

  static TextStyle get bodyMedium =>
      _style(fontSize: 13, fontWeight: FontWeight.w400, height: 1.5);

  static TextStyle get bodySmall =>
      _style(fontSize: 11, fontWeight: FontWeight.w400, height: 1.45);

  static TextStyle get labelLarge =>
      _style(fontSize: 14, fontWeight: FontWeight.w600);

  static TextStyle get labelMedium =>
      _style(fontSize: 12, fontWeight: FontWeight.w500);

  static TextStyle get labelSmall =>
      _style(fontSize: 10, fontWeight: FontWeight.w500);

  static TextStyle get salaryLarge => _style(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.2,
    fontFamily: AppFontFamilies.english,
  );

  static TextStyle get salaryMedium => _style(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    fontFamily: AppFontFamilies.english,
  );

  static TextStyle get matchRate => _style(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    fontFamily: AppFontFamilies.english,
  );

  static TextStyle get button =>
      _style(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: 0.2);

  static TextStyle get buttonSmall =>
      _style(fontSize: 13, fontWeight: FontWeight.w600);

  static TextStyle get caption =>
      _style(fontSize: 11, fontWeight: FontWeight.w400, height: 1.3);

  static TextStyle get overline =>
      _style(fontSize: 10, fontWeight: FontWeight.w600, letterSpacing: 0.8);

  static TextStyle _style({
    required double fontSize,
    required FontWeight fontWeight,
    double? height,
    double? letterSpacing,
    String? fontFamily,
  }) {
    return TextStyle(
     fontFamily: fontFamily ?? AppFontFamilies.current,
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: letterSpacing,
    );
  }
}
