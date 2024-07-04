import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/merchants_cubit/merchants_store_cubit/merchants_store_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/merchants_widgets/custom_sliver_grid.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/merchants_widgets/field_and_list_of_filtering_Item_section.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/widgets/custom_no_data_or_failure.dart';
import 'package:loyalty_app/core/widgets/shimmer_grid.dart';

class MerchantsView extends StatefulWidget {
  const MerchantsView({super.key});

  @override
  State<MerchantsView> createState() => _MerchantsViewState();
}

class _MerchantsViewState extends State<MerchantsView> {
  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MerchantsStoreCubit, MerchantsStoreState>(
      builder: (context, state2) {
        return CustomScrollView(slivers: [
          SliverToBoxAdapter(
              child: FieldAndListOfFilteringItemSection(
            searchController: _searchController,
          )),
          SliverPadding(
              padding: const EdgeInsetsDirectional.only(
                  start: 16, end: 16, bottom: 16),
              sliver: state2 is FetchStoresSuccess
                  ? state2.stores.stores.isNotEmpty
                      ? CustomSliverGrid(state: state2)
                      : const SliverToBoxAdapter(
                          child: CustomNoDataOrFailure(
                              text: 'There is no store at the moment',
                              image: Assets.imagesNoDataCuate),
                        )
                  : state2 is FetchStoresFailure
                      ? SliverToBoxAdapter(
                          child: CustomNoDataOrFailure(
                              text: state2.errMessage,
                              image: Assets.imagesFailure),
                        )
                      : const SliverToBoxAdapter(
                          child: ShimmerGrid(crossAxisCount: 2))),
        ]);
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
