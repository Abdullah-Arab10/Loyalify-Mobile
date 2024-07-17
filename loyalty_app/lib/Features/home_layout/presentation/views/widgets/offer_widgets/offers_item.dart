import 'package:flutter/material.dart';
import 'package:loyalty_app/core/widgets/offer_images_section.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/offer_widgets/offer_texts_section.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';

class OffersItem extends StatelessWidget {
  const OffersItem({
    super.key,
    required this.topMargin,
    required this.leftMargin,
    required this.rightMargin,
    required this.bottomMargin,
    required this.isLogo,
  });

  final double topMargin;
  final double leftMargin;
  final double rightMargin;
  final double bottomMargin;
  final bool isLogo;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [BoxShadow(color: AppColors.lightGray, blurRadius: 8)]),
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsetsDirectional.only(
            top: topMargin,
            start: leftMargin,
            end: rightMargin,
            bottom: bottomMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            OfferImagesSection(
              isLogo: isLogo,
            ),
            const SizedBox(
              height: 10,
            ),
            const OfferTextsSection(),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
