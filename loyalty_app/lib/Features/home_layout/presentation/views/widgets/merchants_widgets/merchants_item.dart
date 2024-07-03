import 'package:flutter/material.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/app_styles.dart';
import 'package:loyalty_app/core/widgets/custom_image.dart';
import 'package:loyalty_app/core/widgets/fitted_text.dart';

class MerchantsItem extends StatelessWidget {
  const MerchantsItem({
    super.key,
    required this.image,
    required this.merchantName,
    required this.categoryName,
  });

  final String image;
  final String merchantName;
  final String categoryName;

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
          Expanded(
            flex: 3,
            child: CustomImage(
              image: Image.network(
                image,
                fit: BoxFit.cover,
              ),
              maxWidth: 250,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              clipBehavior: Clip.antiAlias,
              padding: 0,
              aspectRatio: 1,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          FittedText(
              text: merchantName, textStyle: AppStyles.styleBold20(context)),
          const SizedBox(
            height: 8,
          ),
          FittedText(
              text: categoryName,
              textStyle: AppStyles.styleSemiBold16(context)),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
