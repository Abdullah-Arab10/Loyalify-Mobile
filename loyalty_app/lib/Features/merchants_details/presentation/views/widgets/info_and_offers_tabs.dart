import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/merchants_widgets/filtering_item.dart';
import 'package:loyalty_app/Features/merchants_details/presentation/manager/merchants_details_cubit/merchants_details_cubit.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';

class InfoAndOffersTabs extends StatelessWidget {
  const InfoAndOffersTabs({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: AppColors.lightGray, blurRadius: 8)],
      ),
      margin: const EdgeInsets.only(bottom: 26),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          Expanded(
              child: GestureDetector(
            onTap: () {
              MerchantsDetailsCubit.get(context).changeIndex(0);
            },
            child: FilteringItem(
              text: 'Info',
              isActive: currentIndex == 0,
              leftPaddingForItem: 0,
              horizontalPaddingForText: 0,
              borderRadius: BorderRadius.circular(8),
              alignment: Alignment.center,
              inActiveBackgorundColor: AppColors.white,
              inActiveBorderColor: AppColors.white,
            ),
          )),
          Expanded(
              child: GestureDetector(
            onTap: () {
              MerchantsDetailsCubit.get(context).changeIndex(1);
            },
            child: FilteringItem(
              text: 'Offers',
              isActive: currentIndex == 1,
              leftPaddingForItem: 0,
              horizontalPaddingForText: 0,
              borderRadius: BorderRadius.circular(8),
              alignment: Alignment.center,
              inActiveBackgorundColor: AppColors.white,
              inActiveBorderColor: AppColors.white,
            ),
          )),
        ],
      ),
    );
  }
}
