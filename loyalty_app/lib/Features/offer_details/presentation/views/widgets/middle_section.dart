import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/offer_details/presentation/manager/fetch_offer_details_cubit/fetch_offer_details_cubit.dart';
import 'package:loyalty_app/Features/offer_details/presentation/views/widgets/date_row.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/widgets/custom_container.dart';
import 'package:shimmer/shimmer.dart';

class MiddleSection extends StatelessWidget {
  const MiddleSection({
    super.key,
    required this.state,
  });

  final dynamic state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        state is FetchOfferDetailsSuccess
            ? DateRow(
              createdAt: FetchOfferDetailsCubit.get(context)
                      .offerDetailsModel
                      ?.items
                      ?.createdAt ??
                  '',
              deadline: FetchOfferDetailsCubit.get(context)
                      .offerDetailsModel
                      ?.items
                      ?.deadline ??
                  '',
            )
            : state is FetchOfferDetailsLoading
                ? Shimmer.fromColors(
                  baseColor: AppColors.white,
                  highlightColor: AppColors.sonicSilver,
                  child: const CustomContainer(
                    borderRadius: 30,
                  ),
                )
                : const SizedBox(),
      ],
    );
  }
}
