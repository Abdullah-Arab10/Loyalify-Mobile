import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/merchants_details/data/models/store_details_model/store_details_model.dart';
import 'package:loyalty_app/Features/merchants_details/presentation/views/widgets/item_info.dart';
import 'package:loyalty_app/core/resources/app_styles.dart';
import 'package:loyalty_app/core/utils/app_images.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({
    super.key,
    required this.storeDetailsModel,
  });

  final StoreDetailsModel? storeDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          storeDetailsModel?.items?.description ?? '',
          style: AppStyles.styleSemiBold18(context),
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 16,
        ),
        InfoItem(
          image: Assets.imagesLocation,
          text: storeDetailsModel?.items?.address ?? '',
        ),
        const SizedBox(
          height: 16,
        ),
        InfoItem(
          image: Assets.imagesPhone,
          text: storeDetailsModel?.items?.phoneNumber ?? '',
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
