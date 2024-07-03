import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/merchants_cubit/merchants_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/merchants_widgets/custom_sliver_grid.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/merchants_widgets/field_and_list_of_filtering_Item_section.dart';
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
    return BlocBuilder<MerchantsCubit, MerchantsState>(
      builder: (context, state) {
        return CustomScrollView(slivers: [
          SliverToBoxAdapter(
              child: FieldAndListOfFilteringItemSection(
                  searchController: _searchController)),
          SliverPadding(
              padding: const EdgeInsetsDirectional.only(
                  start: 16, end: 16, bottom: 16),
              sliver: state is FetchStoresSuccess
                  ? CustomSliverGrid(state: state)
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
