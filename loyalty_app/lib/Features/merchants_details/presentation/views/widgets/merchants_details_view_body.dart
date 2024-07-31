import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/merchants_details/presentation/manager/fetch_store_details_cubit/fetch_store_details_cubit.dart';
import 'package:loyalty_app/Features/merchants_details/presentation/manager/merchants_details_cubit/merchants_details_cubit.dart';
import 'package:loyalty_app/Features/merchants_details/presentation/views/widgets/description_section.dart';
import 'package:loyalty_app/Features/merchants_details/presentation/views/widgets/merchants_images_and_tabs.dart';
import 'package:loyalty_app/core/widgets/list_of_offers.dart';

class MerchantsDetailsViewBody extends StatelessWidget {
  const MerchantsDetailsViewBody({
    super.key,
  });

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
                  )),
                  MerchantsDetailsCubit.get(context).currentIndex == 0
                      ? SliverToBoxAdapter(
                          child: DescriptionSection(
                            state: state2,
                          ),
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
        );
      },
    );
  }
}
