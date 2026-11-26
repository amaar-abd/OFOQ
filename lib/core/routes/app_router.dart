import 'package:go_router/go_router.dart';
import 'package:ofoq/core/routes/reouter_path.dart';
import 'package:ofoq/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:ofoq/features/splash/splash_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RouterPath.splash,
    routes: [
      GoRoute(
        path: RouterPath.splash,
        builder: (context, state) => SplashScreen(
          onFinished: () {
            context.go(RouterPath.onboardingScreen);
          },
        ),
      ),
      GoRoute(
        path: RouterPath.onboardingScreen,
        builder: (context, state) => OnboardingScreen(
          onFinished: () {
            //
          },
        ),
      ),
    ],
  );
}
