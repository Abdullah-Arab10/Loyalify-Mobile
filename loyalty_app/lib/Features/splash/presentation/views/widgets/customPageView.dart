import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/splash/data/models/loyalty_page_model.dart';
import 'package:loyalty_app/Features/splash/presentation/views/widgets/loyalty_page.dart';
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
        title1: 'Discover Rewards,',
        title2: 'Embrace Loyalty',
        subTitle:
            'Unlock exclusive perks, earn points effortlessly, and indulge in a world of personalized rewards. Welcome to Loyalify!'),
    const LoyaltyPageModel(
        image: Assets.imagesBrandloyaltyPana,
        title1: 'Earn Points, Enjoy',
        title2: 'Rewards',
        subTitle:
            'Snap receipts, complete surveys, and more. Elevate your loyalty journey with every action. Start earning, start enjoying!'),
    const LoyaltyPageModel(
        image: Assets.imagesBrandloyaltyCuate,
        title1: 'Tailor Your Rewards',
        title2: 'Experience',
        subTitle:
            'Convert points, redeem vouchers, and climb tiers. Your loyalty, your way. Begin your personalized rewards journey with Loyalify!'),
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: listOfPages.length,
      itemBuilder: (BuildContext context, int index) {
        return LoyaltyPage(
          item: listOfPages[index], index: index,
        );
      },
    );
  }
}