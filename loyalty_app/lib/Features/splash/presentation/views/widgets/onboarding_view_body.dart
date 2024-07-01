import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loyalty_app/Features/splash/presentation/views/widgets/custom_page_view.dart';
import 'package:loyalty_app/Features/splash/presentation/views/widgets/dots_indicator_and_buttons.dart';
import 'package:loyalty_app/core/resources/app_router.dart';
import 'package:loyalty_app/core/resources/strings_manager.dart';
import 'package:loyalty_app/core/utils/app_prefs.dart';
import 'package:loyalty_app/core/utils/service_locator.dart';
import 'package:loyalty_app/core/utils/size_config.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController pageController;
  int currentPageIndex = 0;
  String text = AppStrings.Continue;
  final AppPreferences _appPreferences = getIt.get<AppPreferences>();
  _bind() {
    _appPreferences.setOnBoardingScreenViewed();
  }

  @override
  void initState() {
    _bind();
    pageController = PageController();
    pageController.addListener(() {
      currentPageIndex = pageController.page!.round();
      currentPageIndex == 2
          ? text = AppStrings.letsGetStarted
          : text = AppStrings.Continue;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: SizedBox(
          height: SizeConfig.height * .09,
        ),
      ),
      SliverFillRemaining(
        hasScrollBody: false,
        child: Column(children: [
          Expanded(child: CustomPageView(pageController: pageController)),
          const SizedBox(height: 32),
          DotsIndicatorAndButtons(
            currentPageIndex: currentPageIndex,
            text: text,
            onPressed: currentPageIndex != 2 ? () {
              pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } : (){
              GoRouter.of(context).go(AppRouter.kRegisterView);
            },
          ),
        ]),
      ),
    ]);
  }
}
