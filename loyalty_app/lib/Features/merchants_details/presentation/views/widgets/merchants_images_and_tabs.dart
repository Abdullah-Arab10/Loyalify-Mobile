import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/merchants_details/presentation/manager/fetch_store_details_cubit/fetch_store_details_cubit.dart';
import 'package:loyalty_app/Features/merchants_details/presentation/manager/merchants_details_cubit/merchants_details_cubit.dart';
import 'package:loyalty_app/Features/merchants_details/presentation/views/widgets/info_and_offers_tabs.dart';
import 'package:loyalty_app/Features/merchants_details/presentation/views/widgets/merchants_image_and_cover_image.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/widgets/shimmer_placeholder.dart';
import 'package:shimmer/shimmer.dart';

class MerchantsImagesAndTabs extends StatelessWidget {
  const MerchantsImagesAndTabs({
    super.key,
    this.state,
  });

  final dynamic state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        state is FetchStoreDetailsSuccess
            ? MerchantsImageAndCoverImage(
                storeDetailsModel:
                    FetchStoreDetailsCubit.get(context).storeDetailsModel,
              )
            : state is FetchStoreDetailsLoading
                ? Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      bottom: 22,
                    ),
                    child: Shimmer.fromColors(
                      baseColor: AppColors.white,
                      highlightColor: AppColors.sonicSilver,
                      child: ShimmerPlaceholder(
                        aspectRatio: 3 / 1,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  )
                : const SizedBox(),
        state is FetchStoreDetailsFailure
            ? const SizedBox()
            : InfoAndOffersTabs(
                currentIndex: MerchantsDetailsCubit.get(context).currentIndex,
              ),
      ],
    );
  }
}
