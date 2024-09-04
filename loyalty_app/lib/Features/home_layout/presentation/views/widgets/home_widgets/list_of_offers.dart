import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/home_cubits/get_popular_offers_cubit/get_popular_offers_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/offer_widgets/offers_item.dart';
import 'package:loyalty_app/core/resources/app_router.dart';
import 'package:loyalty_app/core/resources/app_styles.dart';
import 'package:loyalty_app/core/widgets/custom_no_data_or_failure.dart';
import 'package:loyalty_app/core/widgets/shimmer_list.dart';

class ListOfOffers extends StatelessWidget {
  const ListOfOffers({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPopularOffersCubit, GetPopularOffersState>(
      builder: (context, state) {
        return state is GetPopularOffersSuccessState
            ? ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: state.popularOffersModel.items!.length,
                itemBuilder: (BuildContext context, int index) => OffersItem(
                  topMargin: 0,
                  leftMargin: index == 0 ? 16 : 0,
                  rightMargin: index == 7 ? 16 : 0,
                  bottomMargin: 0,
                  isLogo: true,
                  coverImage: state.popularOffersModel.items?[index].offerImage,
                  storeImage: state.popularOffersModel.items?[index].storeImage,
                  offerName: state.popularOffersModel.items?[index].offerName,
                  pointsAmount:
                      state.popularOffersModel.items?[index].pointAmount,
                  storeName: state.popularOffersModel.items?[index].storeName,
                  onTap: () => GoRouter.of(context).push(
                    AppRouter.kOfferDetailsView,
                    extra: state.popularOffersModel.items?[index].id ?? '',
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 15,
                ),
              )
            : state is GetPopularOffersFailureState
                ? Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      state.errMessage,
                      style: AppStyles.styleSemiBold20(context),
                      textAlign: TextAlign.center,
                    ),
                  )
                : const ShimmerList(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: false,
                    physics: null,
                    itemCount: 3,
                    isAspectRatio: true,
                    topMargin: 24,
                    leftMargin: 24,
                    rightMargin: 24,
                    itemBorderRadius: 8,
                  );
      },
    );
  }
}
