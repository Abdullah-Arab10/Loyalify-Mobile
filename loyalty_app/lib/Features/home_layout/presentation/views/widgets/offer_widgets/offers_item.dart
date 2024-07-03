import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/offer_widgets/offer_images_section.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/offer_widgets/offer_texts_section.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';

class OffersItem extends StatelessWidget {
  const OffersItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [BoxShadow(color: AppColors.lightGray, blurRadius: 8)]),
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsetsDirectional.only(top: 24, start: 24, end: 24),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            OfferImagesSection(),
            SizedBox(
              height: 10,
            ),
            OfferTextsSection(),
            SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
