import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loyalty_app/Features/splash/presentation/views/widgets/custom_circular_indicator.dart';
import 'package:loyalty_app/Features/splash/presentation/views/widgets/logo_and_sliding_text.dart';
import 'package:loyalty_app/core/resources/app_router.dart';
import 'package:loyalty_app/core/utils/app_prefs.dart';
import 'package:loyalty_app/core/utils/service_locator.dart';
import 'package:loyalty_app/core/utils/size_config.dart';

class SplashViewbody extends StatefulWidget {
  const SplashViewbody({super.key});

  @override
  State<SplashViewbody> createState() => _SplashViewbodyState();
}

class _SplashViewbodyState extends State<SplashViewbody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  final AppPreferences _appPreferences = getIt.get<AppPreferences>();

  
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: SizeConfig.height * .3,
          ),
        ),
        SliverToBoxAdapter(
          child: LogoAndSlidingText(slidingAnimation: slidingAnimation),
        ),
        const SliverFillRemaining(child: Align(
          alignment: Alignment.bottomCenter,
          child: CustomCircularIndicator())),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);

    animationController.forward();
  }

  _goNext() async {
    _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
      if (isUserLoggedIn)
        {
          // navigate to main screen
          //Navigator.pushReplacementNamed(context, Routes.homeLayoutRoute)
        }
      else
        {
          _appPreferences
              .isOnBoardingScreenViewed()
              .then((isOnBoardingScreenViewed) => {
            if (isOnBoardingScreenViewed)
              {
                // navigate to login screen

                GoRouter.of(context).go(AppRouter.kLoginView),
              }
            else
              {
                // navigate to onboarding screen

                GoRouter.of(context).go(AppRouter.kOnboardingView),
              }
          })
        }
    });
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () => _goNext(),
    );
  }
}
