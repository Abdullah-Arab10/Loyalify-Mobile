import 'package:flutter/material.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/app_styles.dart';
import 'package:loyalty_app/core/widgets/offer_cover_image.dart';
import 'package:loyalty_app/core/widgets/offer_texts_section.dart';

class OfferCoverImageAndTextsSection extends StatelessWidget {
  const OfferCoverImageAndTextsSection({
    super.key,
    required this.coverImage,
    required this.offerName,
    required this.pointAmount,
    required this.userPoints,
  });

  final String? coverImage;
  final String? offerName;
  final int? pointAmount;
  final double? userPoints;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(color: AppColors.lightGray, blurRadius: 8)
                ]),
            clipBehavior: Clip.antiAlias,
            child: OfferCoverImage(coverImage: coverImage, aspectRatio: 2 / 1)),
        const SizedBox(
          height: 10,
        ),
        OfferTextsSection(
          leftPadding: 0,
          offerName: offerName ?? '',
          text1: '$userPoints',
          style1: AppStyles.styleSemiBold16(context),
          spacerBetweenText1AndText2: Text(
            ' / ',
            style: AppStyles.styleSemiBold16(context)
                .copyWith(color: AppColors.sonicSilver),
          ),
          text2: '$pointAmount',
          style2: AppStyles.styleSemiBold16(context)
              .copyWith(color: AppColors.sonicSilver),
        ),
      ],
    );
  }
}
