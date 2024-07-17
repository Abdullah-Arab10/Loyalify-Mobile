import 'package:flutter/material.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/widgets/offer_images_section.dart';

class MerchantsImageAndCoverImage extends StatelessWidget {
  const MerchantsImageAndCoverImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 16,
        bottom: 22,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: AppColors.lightGray, blurRadius: 8)],
      ),
      clipBehavior: Clip.antiAlias,
      child: const OfferImagesSection(
        isLogo: true,
      ),
    );
  }
}
