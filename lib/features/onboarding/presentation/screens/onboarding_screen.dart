import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ofoq/core/utils/app_images.dart';
import 'package:ofoq/features/onboarding/presentation/widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key, required this.onFinished});

  final VoidCallback onFinished;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      widget.onFinished();
    }
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      {
        'image': Assets.assetsImagesOnboarding1,
        'start': 'onboarding.page1_start'.tr(),
        'accent': 'onboarding.page1_accent'.tr(),
        'description': 'onboarding.page1_description'.tr(),
      },
      {
        'image': Assets.assetsImagesOnboarding2,
        'start': 'onboarding.page2_start'.tr(),
        'accent': 'onboarding.page2_accent'.tr(),
        'description': 'onboarding.page2_description'.tr(),
      },
      {
        'image': Assets.assetsImagesOnboarding3,
        'start': 'onboarding.page3_start'.tr(),
        'accent': 'onboarding.page3_accent'.tr(),
        'description': 'onboarding.page3_description'.tr(),
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: _pageController,
        itemCount: pages.length,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          final page = pages[index];

          return OnboardingPage(
            image: page['image']!,
            titleStart: page['start']!,
            titleAccent: page['accent']!,
            description: page['description']!,
            currentPage: _currentPage,
            buttonText: index == 2
                ? 'onboarding.start'.tr()
                : 'onboarding.next'.tr(),
            onNext: _nextPage,
          );
        },
      ),
    );
  }
}
