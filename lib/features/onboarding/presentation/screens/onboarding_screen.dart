import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ofoq/core/constants/app_constants.dart';
import 'package:ofoq/core/providers/shared_preferences_provider.dart';
import 'package:ofoq/core/utils/app_images.dart';
import 'package:ofoq/features/onboarding/presentation/widgets/onboarding_page.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key, required this.onFinished});

  final VoidCallback onFinished;

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  late final PageController _pageController;

  int _currentPage = 0;
  bool _isFinishing = false;

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
      _finishOnboarding();
    }
  }

  Future<void> _finishOnboarding() async {
    if (_isFinishing) return;
    _isFinishing = true;
    final prefs = await ref.read(sharedPreferencesServiceProvider.future);
    await prefs.setBool(AppConstants.onboardingKey, true);
    if (!mounted) return;
    widget.onFinished();
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
