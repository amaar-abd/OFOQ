import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDimensions {
  AppDimensions._();

  // Spacing
  static double get spaceXS => 4.h;
  static double get spaceS => 8.h;
  static double get spaceM => 12.h;
  static double get spaceL => 16.h;
  static double get spaceXL => 24.h;
  static double get spaceXXL => 32.h;

  // Horizontal Padding
  static double get pageHorizontal => 28.w;

  // Buttons
  static double get buttonHeight => 56.h;

  // Border Radius
  static double get radiusS => 8.r;
  static double get radiusM => 16.r;
  static double get radiusL => 24.r;
  static double get radiusXL => 32.r;

  // Icons
  static double get iconSmall => 18.sp;
  static double get iconMedium => 22.sp;
  static double get iconLarge => 24.sp;

  // Onboarding
  static double get onboardingIndicatorActive => 12.w;
  static double get onboardingIndicatorInactive => 9.w;
}
