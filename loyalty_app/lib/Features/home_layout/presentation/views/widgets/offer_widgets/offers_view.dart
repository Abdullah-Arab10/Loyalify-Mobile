import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/offers_cubit/offers_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/offer_widgets/list_of_offers.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/widgets/custom_no_data_or_failure.dart';
import 'package:loyalty_app/core/widgets/shimmer_list.dart';

class OffersView extends StatefulWidget {
  const OffersView({super.key});

  @override
  State<OffersView> createState() => _OffersViewState();
}

class _OffersViewState extends State<OffersView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          OffersCubit.get(context).fetchAllOffersUser();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OffersCubit, OffersState>(
      listener: (context, state) {
        if (state is FetchOffersLoading) {
          OffersCubit.get(context).determineOffers(state.oldOffers, true);
        } else if (state is FetchOffersSuccess) {
          OffersCubit.get(context).determineOffers(state.offers, false);
        }
      },
      builder: (context, state) {
        if (state is FetchOffersLoading && state.isFirstFetch) {
          return const ShimmerList(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 6,
            isAspectRatio: true,
            topMargin: 24,
            leftMargin: 24,
            rightMargin: 24,
            itemBorderRadius: 8,
          );
        } else if (state is FetchOffersFailure) {
          return CustomNoDataOrFailure(
              text: state.errMessage, image: Assets.imagesFailure);
        } else {
          return RefreshIndicator(
            onRefresh: () async{
              OffersCubit.get(context).fetchAllOffersUser();
            },
            child: Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 24),
                child: ListOfOffers(
                  topMargin: 24,
                  leftMargin: 24,
                  rightMargin: 24,
                  bottomMargin: 0,
                  isLogo: true,
                  offers: OffersCubit.get(context).offers,
                  isLoading: OffersCubit.get(context).isLoading,
                  scrollController: _scrollController,
                )),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
