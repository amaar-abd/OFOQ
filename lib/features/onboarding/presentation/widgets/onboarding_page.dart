import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ofoq/core/constants/app_dimensions.dart';

import 'onboarding_clipper.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.image,
    required this.titleStart,
    required this.titleAccent,
    required this.description,
    required this.currentPage,
    required this.buttonText,
    required this.onNext,
  });

  final String image;
  final String titleStart;
  final String titleAccent;
  final String description;
  final int currentPage;
  final String buttonText;
  final VoidCallback onNext;

  static const Color navy = Color(0xFF041B3A);
  static const Color gold = Color(0xFFE5A52E);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallHeight = constraints.maxHeight < 750;

        return Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                image,
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),

            // White Content Section
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: constraints.maxHeight * 0.52,
              child: ClipPath(
                clipper: OnboardingClipper(),
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(
                    AppDimensions.pageHorizontal,
                    isSmallHeight ? 40.h : 55.h,
                    AppDimensions.pageHorizontal,
                    isSmallHeight ? 20.h : 30.h,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: isSmallHeight ? 24.h : 40.h),

                      // Title
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: titleStart),
                            TextSpan(
                              text: titleAccent,

                              style: const TextStyle(color: gold),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                        style: textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 26.sp,
                          color: navy,
                        ),
                      ),

                      SizedBox(height: isSmallHeight ? 12.h : 20.h),

                      // Description
                      Text(
                        description,
                        textAlign: TextAlign.center,
                        style: textTheme.bodyLarge?.copyWith(
                          fontSize: 16,
                          height: 1.7,
                          color: navy,
                        ),
                      ),

                      const Spacer(),

                      // Page Indicator
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) {
                          final isActive = index == currentPage;

                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            margin: EdgeInsets.symmetric(horizontal: 4.w),
                            width: isActive
                                ? AppDimensions.onboardingIndicatorActive
                                : AppDimensions.onboardingIndicatorInactive,
                            height: isActive
                                ? AppDimensions.onboardingIndicatorActive
                                : AppDimensions.onboardingIndicatorInactive,
                            decoration: BoxDecoration(
                              color: isActive ? gold : const Color(0xFFD0D4DE),
                              shape: BoxShape.circle,
                            ),
                          );
                        }),
                      ),

                      SizedBox(height: isSmallHeight ? 16.h : 24.h),

                      // Next Button
                      SizedBox(
                        width: double.infinity,
                        height: AppDimensions.buttonHeight,
                        child: ElevatedButton(
                          onPressed: onNext,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: navy,
                            foregroundColor: Colors.white,
                            elevation: 3,
                            textStyle: textTheme.labelLarge,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AppDimensions.radiusXL,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Spacer(),
                              Text(buttonText),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward_rounded,
                                size: AppDimensions.iconLarge,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
