import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/merchants_details/presentation/manager/merchants_details_cubit/merchants_details_cubit.dart';
import 'package:loyalty_app/Features/merchants_details/presentation/views/widgets/info_and_offers_tabs.dart';
import 'package:loyalty_app/Features/merchants_details/presentation/views/widgets/info_page.dart';
import 'package:loyalty_app/Features/merchants_details/presentation/views/widgets/merchants_image_and_cover_image.dart';
import 'package:loyalty_app/core/widgets/list_of_offers.dart';

class MerchantsDetailsViewBody extends StatelessWidget {
  const MerchantsDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MerchantsDetailsCubit(),
      child: BlocBuilder<MerchantsDetailsCubit, MerchantsDetailsState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: MerchantsImageAndCoverImage(),
                ),
                SliverToBoxAdapter(
                  child: InfoAndOffersTabs(
                    currentIndex:
                        MerchantsDetailsCubit.get(context).currentIndex,
                  ),
                ),
                MerchantsDetailsCubit.get(context).currentIndex == 0
                    ? const SliverToBoxAdapter(
                        child: InfoPage(),
                      )
                    : const ListOfOffers(
                        topMargin: 0,
                        leftMargin: 0,
                        rightMargin: 0,
                        bottomMargin: 26,
                        isLogo: false,
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
