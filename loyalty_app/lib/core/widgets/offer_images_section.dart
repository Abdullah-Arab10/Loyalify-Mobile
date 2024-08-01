import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/merchants_details/data/models/store_details_model/store_details_model.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/utils/api_service.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/utils/size_config.dart';
import 'package:loyalty_app/core/widgets/custom_icon.dart';
import 'package:loyalty_app/core/widgets/custom_image.dart';
import 'package:loyalty_app/core/widgets/offer_cover_image.dart';

class OfferImagesSection extends StatelessWidget {
  const OfferImagesSection({
    super.key,
    required this.isLogo,
    this.storeDetailsModel,
    required this.coverImageAspectRatio,
  });

  final bool isLogo;
  final StoreDetailsModel? storeDetailsModel;
  final double coverImageAspectRatio;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        OfferCoverImage(
          storeDetailsModel: storeDetailsModel,
          aspectRatio: coverImageAspectRatio,
        ),
        isLogo == true
            ? StoreImage(storeDetailsModel: storeDetailsModel)
            : const SizedBox()
      ],
    );
  }
}

class StoreImage extends StatelessWidget {
  const StoreImage({
    super.key,
    required this.storeDetailsModel,
  });

  final StoreDetailsModel? storeDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: CustomImage(
        image: storeDetailsModel?.items?.storeImage != null
            ? Image.network(
                '${ApiService.baseUrl}${storeDetailsModel?.items?.storeImage}',
                fit: BoxFit.cover,
              )
            : Container(
                color: AppColors.white,
                padding: const EdgeInsetsDirectional.only(top: 16),
                child: const CustomIcon(
                  image: Assets.imagesDefaultStoreImage,
                  fit: BoxFit.scaleDown,
                  isColor: false,
                  padding: 0,
                  color: null,
                ),
              ),
        maxWidth: SizeConfig.width <= 800 ? 45 : 60,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        clipBehavior: Clip.antiAlias,
        padding: 0,
        aspectRatio: 1,
      ),
    );
  }
}
