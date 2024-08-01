import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loyalty_app/Features/offer_details/presentation/views/widgets/offer_details_view_body.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/widgets/custom_app_bar.dart';
import 'package:loyalty_app/core/widgets/custom_icon.dart';

class OfferDetailsView extends StatelessWidget {
  const OfferDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gainsboro,
      appBar: CustomAppBar(
        backgroundColor: AppColors.gainsboro,
        svgPicture: CustomIcon(
          image: Assets.imagesLeftArrow,
          color: AppColors.black,
          padding: 12,
        ),
        isTitle: true,
        title: 'Offer Details',
        onTap: () {
          GoRouter.of(context).pop();
        },
      ),
      body: const OfferDetailsViewBody(),
    );
  }
}
