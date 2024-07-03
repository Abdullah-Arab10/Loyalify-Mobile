import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/home_layout_cubit/home_layout_cubit.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/strings_manager.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/widgets/custom_icon.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.gainsboro,
      elevation: 0,
      onTap: (value) {
        HomeLayoutCubit.get(context).changeIndex(context, value);
      },
      items: [
        BottomNavigationBarItem(
            icon: CustomIcon(
              image: Assets.imagesHome,
              color: currentIndex == 0
                  ? AppColors.kPrimaryColor
                  : AppColors.darkGainsboro,
              padding: 0,
            ),
            label: AppStrings.home),
        BottomNavigationBarItem(
            icon: CustomIcon(
              image: Assets.imagesMerchants,
              color: currentIndex == 1
                  ? AppColors.kPrimaryColor
                  : AppColors.darkGainsboro,
              padding: 0,
            ),
            label: AppStrings.merchants),
        BottomNavigationBarItem(
            icon: CustomIcon(
              image: Assets.imagesOffer,
              color: currentIndex == 2
                  ? AppColors.kPrimaryColor
                  : AppColors.darkGainsboro,
              padding: 0,
            ),
            label: AppStrings.offers),
        BottomNavigationBarItem(
            icon: CustomIcon(
              image: Assets.imagesVoucher,
              color: currentIndex == 3
                  ? AppColors.kPrimaryColor
                  : AppColors.darkGainsboro,
              padding: 0,
            ),
            label: AppStrings.myVoucher),
        BottomNavigationBarItem(
            icon: CustomIcon(
              image: Assets.imagesAccount,
              color: currentIndex == 4
                  ? AppColors.kPrimaryColor
                  : AppColors.darkGainsboro,
              padding: 0,
            ),
            label: AppStrings.account),
      ],
    );
  }
}
