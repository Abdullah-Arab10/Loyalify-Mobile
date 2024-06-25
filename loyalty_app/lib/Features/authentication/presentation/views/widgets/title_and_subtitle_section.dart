import 'package:flutter/material.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/app_images.dart';
import 'package:loyalty_app/core/resources/app_styles.dart';
import 'package:loyalty_app/core/resources/strings_manager.dart';
import 'package:loyalty_app/core/widgets/custom_icon.dart';

class TitleAndSubTitleSection extends StatelessWidget {
  const TitleAndSubTitleSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              AppStrings.joinLoyalifyToday,
              style: AppStyles.styleBold29(context),
            ),
            CustomIcon(
              image: Assets.imagesPerson,
              color: AppColors.kPrimaryColor,
            ),
          ],
        ),
        const SizedBox(
          width: 24,
        ),
        Text(
          AppStrings.unlockRewardsStartEarningNow,
          style: AppStyles.styleMedium18(context).copyWith(
            color: AppColors.grey600,
          ),
        ),
      ],
    );
  }
}