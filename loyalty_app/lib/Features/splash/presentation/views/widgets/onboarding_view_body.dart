import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/splash/presentation/views/widgets/custom_page_view.dart';
import 'package:loyalty_app/Features/splash/presentation/views/widgets/dots_indicator_and_buttons.dart';
import 'package:loyalty_app/core/resources/strings_manager.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController pageController;
  int currentPageIndex = 0;
  String text = AppStrings.Continue;

  @override
  void initState() {
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
    return CustomScrollView(slivers: [
      SliverFillRemaining(
        //hasScrollBody: false,
        child: Column(children: [
          Expanded(child: CustomPageView(pageController: pageController)),
          DotsIndicatorAndButtons(
            currentPageIndex: currentPageIndex,
            text: text,
          ),
        ]),
      ),
    ]);
  }
}
