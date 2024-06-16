import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/splash/presentation/views/widgets/CustomPageView.dart';
import 'package:loyalty_app/Features/splash/presentation/views/widgets/dots_indicator_and_buttons.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {

  late PageController pageController;
  int currentPageIndex = 0;
  String text = 'Continue';

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPageIndex = pageController.page!.round();
      currentPageIndex == 2 ? text = 'Let\'s Get Started' : text = 'Continue';
      setState(() {});
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CustomPageView(pageController: pageController),
      DotsIndicatorAndButtons(currentPageIndex: currentPageIndex, text: text,),
    ]);
  }
}




