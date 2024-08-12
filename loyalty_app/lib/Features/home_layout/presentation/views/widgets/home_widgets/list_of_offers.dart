import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/offer_widgets/offers_item.dart';

class ListOfOffers extends StatelessWidget {
  const ListOfOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 8,
      itemBuilder: (BuildContext context, int index) => OffersItem(
          topMargin: 0,
          leftMargin: index == 0 ? 16 : 0,
          rightMargin: index == 7 ? 16 : 0,
          bottomMargin: 0,
          isLogo: true,
          coverImage: null,
          storeImage: null,
          offerName: 'Get Free 1 Cup Coffee E-Voucher',
          pointsAmount: 3750,
          storeName: 'Starbucks',
          onTap: () {}),
      separatorBuilder: (context, index) => const SizedBox(
        width: 15,
      ),
    );
  }
}
