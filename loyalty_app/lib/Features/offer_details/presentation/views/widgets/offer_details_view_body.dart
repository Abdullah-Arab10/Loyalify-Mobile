import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/offer_details/presentation/manager/fetch_offer_details_cubit/fetch_offer_details_cubit.dart';
import 'package:loyalty_app/Features/offer_details/presentation/views/widgets/middle_section.dart';
import 'package:loyalty_app/Features/offer_details/presentation/views/widgets/offer_description_and_button_section.dart';
import 'package:loyalty_app/Features/offer_details/presentation/views/widgets/top_section.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/widgets/custom_no_data_or_failure.dart';
import 'package:loyalty_app/core/widgets/shimmer_list.dart';

class OfferDetailsViewBody extends StatelessWidget {
  const OfferDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchOfferDetailsCubit, FetchOfferDetailsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: state is FetchOfferDetailsFailure
              ? CustomNoDataOrFailure(
                  text: state.errMessage, image: Assets.imagesFailure)
              : CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: TopSection(
                        state: state,
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 10,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: MiddleSection(
                        state: state,
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: Divider(
                        height: 30,
                        color: Color(0xffEEEEF1),
                      ),
                    ),
                    state is FetchOfferDetailsSuccess
                        ? SliverFillRemaining(
                            hasScrollBody: false,
                            child: Expanded(
                              child: OfferDescriptionAndButtonSection(
                                description: FetchOfferDetailsCubit.get(context)
                                        .offerDetailsModel
                                        ?.items
                                        ?.description ??
                                    '',
                              ),
                            ),
                          )
                        : state is FetchOfferDetailsLoading
                            ? const SliverToBoxAdapter(
                                child: ShimmerList(
                                  itemCount: 20,
                                  bottomMargin: 50,
                                  itemBorderRadius: 30,
                                ),
                              )
                            : const SliverToBoxAdapter(child: SizedBox()),
                  ],
                ),
        );
      },
    );
  }
}
