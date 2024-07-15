import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/merchants_cubit/merchants_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/search_view_body.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/strings_manager.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/widgets/custom_app_bar.dart';
import 'package:loyalty_app/core/widgets/custom_icon.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key,});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  late TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gainsboro,
      appBar: CustomAppBar(
        isTitle: true,
        title: AppStrings.searchPage,
        backgroundColor: AppColors.gainsboro,
        svgPicture: CustomIcon(
          image: Assets.imagesLeftArrow,
          color: AppColors.black,
          padding: 12.0,
        ),
        onTap: () {
          GoRouter.of(context).pop();
          MerchantsCubit.get(context).changeIndex(0);
        },
      ),
      body: SearchViewBody(searchController: _searchController,),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
