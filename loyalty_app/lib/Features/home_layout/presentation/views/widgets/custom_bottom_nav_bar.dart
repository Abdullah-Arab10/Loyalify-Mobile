import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/home_layout_cubit/home_layout_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/custom_icon_bottom_nav_bar.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/strings_manager.dart';
import 'package:loyalty_app/core/utils/app_images.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key, required this.currentIndex,
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
            icon: CustomIconBottomNavBar(
                image: Assets.imagesHome,
                color: currentIndex == 0
                    ? AppColors.kPrimaryColor
                    : AppColors.darkGainsboro),
            label: AppStrings.home),
        BottomNavigationBarItem(
            icon: CustomIconBottomNavBar(
                image: Assets.imagesMerchants,
                color: currentIndex == 1
                    ? AppColors.kPrimaryColor
                    : AppColors.darkGainsboro),
            label: AppStrings.merchants),
        BottomNavigationBarItem(
            icon: CustomIconBottomNavBar(
                image: Assets.imagesVoucher,
                color: currentIndex == 2
                    ? AppColors.kPrimaryColor
                    : AppColors.darkGainsboro),
            label: AppStrings.myVoucher),
        BottomNavigationBarItem(
            icon: CustomIconBottomNavBar(
                image: Assets.imagesActivity,
                color: currentIndex == 3
                    ? AppColors.kPrimaryColor
                    : AppColors.darkGainsboro),
            label: AppStrings.activity),
        BottomNavigationBarItem(
            icon: CustomIconBottomNavBar(
                image: Assets.imagesAccount,
                color: currentIndex == 4
                    ? AppColors.kPrimaryColor
                    : AppColors.darkGainsboro),
            label: AppStrings.account),
      ],
    );
  }
}