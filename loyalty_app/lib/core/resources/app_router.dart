import 'package:go_router/go_router.dart';
import 'package:loyalty_app/Features/authentication/presentation/views/login_view.dart';
import 'package:loyalty_app/Features/authentication/presentation/views/register_view.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/home_layout_view.dart';
import 'package:loyalty_app/Features/splash/presentation/views/on_boarding_view.dart';
import 'package:loyalty_app/Features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const  kOnboardingView = '/onboardingView';
  static const  kLoginView = '/loginView';
  static const  kRegisterView = '/registerView';
  static const  kHomeLayoutView = '/homeLayoutView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const RegisterView();
        },
      ),
      GoRoute(
        path: kOnboardingView,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: kHomeLayoutView,
        builder: (context, state) => const HomeLayoutView(),
      ),
    ],
  );
}
