import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/merchants_details/data/models/store_details_model/store_details_model.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/utils/api_service.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/widgets/custom_icon.dart';

class OfferCoverImage extends StatelessWidget {
  const OfferCoverImage({
    super.key,
    required this.storeDetailsModel,
    required this.aspectRatio,
  });

  final StoreDetailsModel? storeDetailsModel;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: storeDetailsModel?.items?.coverImage != null
          ? Image.network(
              '${ApiService.baseUrl}${storeDetailsModel?.items?.coverImage}',
              fit: BoxFit.cover,
            )
          : Container(
              color: AppColors.white,
              padding: const EdgeInsetsDirectional.only(top: 16),
              child: CustomIcon(
                image: Assets.imagesDefaultStoreCoverImage,
                color: AppColors.kPrimaryColor,
                fit: BoxFit.scaleDown,
                padding: 0,
              ),
            ),
    );
  }
}
