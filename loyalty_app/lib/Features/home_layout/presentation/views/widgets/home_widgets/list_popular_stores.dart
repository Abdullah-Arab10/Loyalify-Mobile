import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/home_cubits/get_popular_stores_cubit/get_popular_stores_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/home_widgets/popular_store.dart';
import 'package:loyalty_app/core/resources/app_router.dart';
import 'package:loyalty_app/core/resources/app_styles.dart';
import 'package:loyalty_app/core/widgets/shimmer_list.dart';

class ListPopularStores extends StatelessWidget {
  const ListPopularStores({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPopularStoresCubit, GetPopularStoresState>(
      builder: (context, state) {
        return state is GetPopularStoresSuccessState
            ? ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: state.popularStoresModel.items!.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: EdgeInsets.only(
                      left: index == 0 ? 16 : 0, right: index == 7 ? 16 : 0),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(
                        AppRouter.kMerchantcDetailsView,
                        extra: state.popularStoresModel.items?[index].id,
                      );
                    },
                    child: PopularStore(
                      storeImage:
                          state.popularStoresModel.items?[index].storeImage ??
                              '',
                      storeName:
                          state.popularStoresModel.items?[index].name ?? '',
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 15,
                ),
              )
            : state is GetPopularStoresFailureState
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
                    itemCount: 5,
                    isAspectRatio: true,
                    aspectRatio: 1.1 / 1,
                    topMargin: 24,
                    leftMargin: 24,
                    rightMargin: 0,
                    itemBorderRadius: 8,
                  );
      },
    );
  }
}
