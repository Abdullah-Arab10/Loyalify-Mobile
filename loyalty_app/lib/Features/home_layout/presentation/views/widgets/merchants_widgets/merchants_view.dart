import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/merchants_cubit/merchants_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/merchants_cubit/search_cubit/search_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/categories_and_stores_body.dart';
import 'package:loyalty_app/core/resources/app_router.dart';

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
    return CategoriesAndStoresBody(
      searchController: _searchController,
      onFieldSubmitted: (value) {
        SearchCubit.get(context).searchStores(
            categoryId: MerchantsCubit.get(context).currentIndex,
            search: value);
        GoRouter.of(context).push(AppRouter.kSearchView);
        _searchController.text = "";
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
