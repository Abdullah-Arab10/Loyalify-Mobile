import 'package:flutter/material.dart';
import 'package:loyalty_app/core/widgets/offer_images_section.dart';
import 'package:loyalty_app/core/widgets/offer_texts_section.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';

class OffersItem extends StatelessWidget {
  const OffersItem({
    super.key,
    required this.topMargin,
    required this.leftMargin,
    required this.rightMargin,
    required this.bottomMargin,
    required this.isLogo,
    required this.coverImage,
    required this.storeImage,
    required this.offerName,
    required this.pointsAmount,
    required this.storeName,
  });

  final double topMargin;
  final double leftMargin;
  final double rightMargin;
  final double bottomMargin;
  final bool isLogo;
  final String? coverImage;
  final String? storeImage;
  final String? offerName;
  final int? pointsAmount;
  final String? storeName;

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
              coverImageAspectRatio: 3 / 1,
              coverImage: coverImage,
              storeImage: storeImage,
            ),
            const SizedBox(
              height: 10,
            ),
            OfferTextsSection(
              offerName: offerName ?? '',
              text1: '$pointsAmount',
              text2: storeName ?? '',
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
