import 'package:flutter/material.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/utils/api_service.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/widgets/custom_icon.dart';

class OfferCoverImage extends StatelessWidget {
  const OfferCoverImage({
    super.key,
    required this.aspectRatio,
    required this.coverImage,
  });

  final String? coverImage;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: coverImage != null
          ? Image.network(
              '${ApiService.baseUrl}$coverImage',
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
