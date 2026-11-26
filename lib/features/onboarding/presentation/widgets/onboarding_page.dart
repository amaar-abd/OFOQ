import 'package:flutter/material.dart';

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
    return LayoutBuilder(
      builder: (context, constraints) {
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
                  padding: const EdgeInsets.fromLTRB(28, 55, 28, 30),
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
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
                        style: const TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: navy,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Description
                      Text(
                        description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 17,
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
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: isActive ? 12 : 9,
                            height: isActive ? 12 : 9,
                            decoration: BoxDecoration(
                              color: isActive ? gold : const Color(0xFFD0D4DE),
                              shape: BoxShape.circle,
                            ),
                          );
                        }),
                      ),

                      const SizedBox(height: 24),

                      // Next Button
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: onNext,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: navy,
                            foregroundColor: Colors.white,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Spacer(),
                              Text(
                                buttonText,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              const Icon(Icons.arrow_forward_rounded),
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
