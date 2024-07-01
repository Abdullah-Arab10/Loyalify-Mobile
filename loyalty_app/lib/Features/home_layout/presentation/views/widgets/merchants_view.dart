import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/authentication/data/models/text_field_model.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/custom_sliver_grid.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/field_and_list_of_filtering_Item_section.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/list_of_filtering_item.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/strings_manager.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/widgets/custom_text_field_widget.dart';

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
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
          child: FieldAndListOfFilteringItemSection(
              searchController: _searchController)),
      const SliverPadding(
          padding: EdgeInsetsDirectional.only(start: 16, end: 16, bottom: 16),
          sliver: CustomSliverGrid()),
    ]);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
