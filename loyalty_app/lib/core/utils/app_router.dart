import 'package:go_router/go_router.dart';
import 'package:loyalty_app/Features/authentication/presentation/views/login_view.dart';
import 'package:loyalty_app/Features/splash/presentation/views/onBoarding_view.dart';
import 'package:loyalty_app/Features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const  kOnboardingView = '/onboardingView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kOnboardingView,
        builder: (context, state) => const OnboardingView(),
      ),
    ],
  );
}
