import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/merchants_cubit/merchants_store_cubit/merchants_store_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/merchants_widgets/custom_sliver_grid.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/merchants_widgets/field_and_list_of_filtering_Item_section.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/widgets/custom_no_data_or_failure.dart';
import 'package:loyalty_app/core/widgets/shimmer_grid.dart';

class CategoriesAndStoresBody extends StatelessWidget {
  const CategoriesAndStoresBody({
    super.key,
    required TextEditingController searchController,
    required this.onFieldSubmitted,
  }) : _searchController = searchController;

  final TextEditingController _searchController;
  final ValueChanged<String> onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MerchantsStoreCubit, MerchantsStoreState>(
      builder: (context, state) {
        return CustomScrollView(slivers: [
          SliverToBoxAdapter(
              child: FieldAndListOfFilteringItemSection(
            searchController: _searchController,
            onFieldSubmitted: onFieldSubmitted,
            fetchOrSearch: true,
          )),
          SliverPadding(
              padding: const EdgeInsetsDirectional.only(
                  start: 16, end: 16, bottom: 16),
              sliver: state is FetchStoresSuccess
                  ? state.stores.stores.isNotEmpty
                      ? CustomSliverGrid(state: state)
                      : const SliverToBoxAdapter(
                          child: CustomNoDataOrFailure(
                              text: 'There is no store at the moment',
                              image: Assets.imagesNoDataCuate),
                        )
                  : state is FetchStoresFailure
                      ? SliverToBoxAdapter(
                          child: CustomNoDataOrFailure(
                              text: state.errMessage,
                              image: Assets.imagesFailure),
                        )
                      : const SliverToBoxAdapter(
                          child: ShimmerGrid(crossAxisCount: 2))),
        ]);
      },
    );
  }
}
