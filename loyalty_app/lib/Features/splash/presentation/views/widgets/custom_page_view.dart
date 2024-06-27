import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/splash/data/models/loyalty_page_model.dart';
import 'package:loyalty_app/Features/splash/presentation/views/widgets/loyalty_page.dart';
import 'package:loyalty_app/core/resources/strings_manager.dart';
import 'package:loyalty_app/core/utils/app_images.dart';

class CustomPageView extends StatelessWidget {
  CustomPageView({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  final listOfPages = [
    const LoyaltyPageModel(
        image: Assets.imagesBrandloyaltyRafiki,
        title1: AppStrings.discoverRewards,
        title2: AppStrings.embraceLoyalty,
        subTitle: AppStrings.welcomeToLoyalify),
    const LoyaltyPageModel(
        image: Assets.imagesBrandloyaltyPana,
        title1: AppStrings.earnPointsEnjoy,
        title2: AppStrings.rewards,
        subTitle: AppStrings.startEnjoying),
    const LoyaltyPageModel(
        image: Assets.imagesBrandloyaltyCuate,
        title1: AppStrings.tailorYourRewards,
        title2: AppStrings.experience,
        subTitle: AppStrings.journeywithLoyalify),
  ];

  @override
  Widget build(BuildContext context) {
        /*return ExpandablePageView(
      controller: pageController,
      scrollDirection: Axis.horizontal,
      children: List.generate(
        listOfPages.length,
        (index) => LoyaltyPage(
          item: listOfPages[index],
          index: index,
        ),
      ),
    );*/
    return PageView.builder(
      controller: pageController,
      itemCount: listOfPages.length,
      itemBuilder: (BuildContext context, int index) {
        return LoyaltyPage(
          item: listOfPages[index],
          index: index,
        );
      },
    );
  }
}
