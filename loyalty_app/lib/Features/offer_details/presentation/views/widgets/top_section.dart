import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/offer_details/presentation/manager/fetch_offer_details_cubit/fetch_offer_details_cubit.dart';
import 'package:loyalty_app/Features/offer_details/presentation/views/widgets/offer_cover_image_and_texts_section.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/widgets/shimmer_placeholder.dart';
import 'package:shimmer/shimmer.dart';

class TopSection extends StatelessWidget {
  const TopSection({
    super.key,
    required this.state,
  });

  final dynamic state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        state is FetchOfferDetailsSuccess
            ? OfferCoverImageAndTextsSection(
              coverImage: FetchOfferDetailsCubit.get(context)
                  .offerDetailsModel
                  ?.items
                  ?.image,
              offerName: FetchOfferDetailsCubit.get(context)
                  .offerDetailsModel
                  ?.items
                  ?.name,
              pointAmount: FetchOfferDetailsCubit.get(context)
                  .offerDetailsModel
                  ?.items
                  ?.pointAmount,
              userPoints: FetchOfferDetailsCubit.get(context)
                  .offerDetailsModel
                  ?.items
                  ?.userPoints,
            )
            : state is FetchOfferDetailsLoading
                ? Shimmer.fromColors(
                  baseColor: AppColors.white,
                  highlightColor: AppColors.sonicSilver,
                  child: ShimmerPlaceholder(
                    aspectRatio: 2 / 1,
                    borderRadius: BorderRadius.circular(8),
                  ),
                )
                : const SizedBox(),
      ],
    );
  }
}