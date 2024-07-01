import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/merchants_image.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/app_styles.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/widgets/fitted_text.dart';

class MerchantsItem extends StatelessWidget {
  const MerchantsItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [BoxShadow(color: AppColors.lightGray, blurRadius: 8)]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 8,
          ),
          const Expanded(
            flex: 3,
            child: MerchantsImage(
              image: Assets.imagesSss,
              maxWidth: 250,
              decoration: BoxDecoration(shape: BoxShape.circle),
              clipBehavior: Clip.antiAlias,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          FittedText(
              text: 'Loyalify', textStyle: AppStyles.styleBold20(context)),
          const SizedBox(
            height: 8,
          ),
          FittedText(
              text: 'Food & Drinks',
              textStyle: AppStyles.styleSemiBold16(context)),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
