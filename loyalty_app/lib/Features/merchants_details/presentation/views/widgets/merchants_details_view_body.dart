import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/merchants_details/presentation/manager/fetch_store_details_cubit/fetch_store_details_cubit.dart';
import 'package:loyalty_app/Features/merchants_details/presentation/manager/fetch_store_offers_cubit/fetch_store_offers_cubit.dart';
import 'package:loyalty_app/Features/merchants_details/presentation/manager/merchants_details_cubit/merchants_details_cubit.dart';
import 'package:loyalty_app/Features/merchants_details/presentation/views/widgets/description_section.dart';
import 'package:loyalty_app/Features/merchants_details/presentation/views/widgets/list_of_store_offers.dart';
import 'package:loyalty_app/Features/merchants_details/presentation/views/widgets/merchants_images_and_tabs.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/widgets/custom_no_data_or_failure.dart';
import 'package:loyalty_app/core/widgets/shimmer_list.dart';

class MerchantsDetailsViewBody extends StatelessWidget {
  const MerchantsDetailsViewBody({
    super.key,
    required this.storeId,
  });

  final int storeId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MerchantsDetailsCubit, MerchantsDetailsState>(
      builder: (context, state) {
        return BlocBuilder<FetchStoreDetailsCubit, FetchStoreDetailsState>(
          builder: (context, state2) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                      child: MerchantsImagesAndTabs(
                    state: state2,
                    storeId: storeId,
                  )),
                  MerchantsDetailsCubit.get(context).currentIndex == 0
                      ? SliverToBoxAdapter(
                          child: DescriptionSection(
                            state: state2,
                          ),
                        )
                      : BlocBuilder<FetchStoreOffersCubit,
                          FetchStoreOffersState>(
                          builder: (context, state) {
                            return state is FetchStoreOffersSuccess
                                ? ListOfStoreOffers(
                                    bottomMargin: 26,
                                    isLogo: false,
                                    state: state,
                                  )
                                : state is FetchStoreOffersFailure
                                    ? SliverToBoxAdapter(
                                        child: CustomNoDataOrFailure(
                                            text: state.errMessage,
                                            image: Assets.imagesFailure),
                                      )
                                    : const SliverToBoxAdapter(
                                        child: ShimmerList(
                                        itemCount: 6,
                                        isAspectRatio: true,
                                        aspectRatio: 1.8 / 1,
                                        bottomMargin: 26,
                                        itemBorderRadius: 8,
                                      ));
                          },
                        ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
