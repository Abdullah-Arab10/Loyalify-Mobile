import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/offer_widgets/offers_item.dart';
import 'package:loyalty_app/Features/merchants_details/presentation/manager/fetch_store_offers_cubit/fetch_store_offers_cubit.dart';
import 'package:loyalty_app/core/resources/app_router.dart';

class ListOfStoreOffers extends StatelessWidget {
  const ListOfStoreOffers({
    super.key,
    this.topMargin = 0.0,
    this.leftMargin = 0.0,
    this.rightMargin = 0.0,
    this.bottomMargin = 0.0,
    required this.isLogo,
    required this.state,
  });

  final double topMargin;
  final double leftMargin;
  final double rightMargin;
  final double bottomMargin;
  final bool isLogo;
  final FetchStoreOffersSuccess state;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: state.storeOffers.items.length,
      itemBuilder: (BuildContext context, int index) => OffersItem(
        topMargin: topMargin,
        leftMargin: leftMargin,
        rightMargin: rightMargin,
        bottomMargin: bottomMargin,
        isLogo: isLogo,
        coverImage: state.storeOffers.items[index].offerImage,
        storeImage: state.storeOffers.items[index].storeImage,
        offerName: state.storeOffers.items[index].offerName,
        pointsAmount: state.storeOffers.items[index].pointAmount,
        storeName: state.storeOffers.items[index].storeName,
        onTap: () => GoRouter.of(context).push(
                AppRouter.kOfferDetailsView,
                extra: state.storeOffers.items[index].id ?? '',
              ),
      ),
    );
  }
}
