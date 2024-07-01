import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/authentication/data/models/text_field_model.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/list_of_filtering_item.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/strings_manager.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/widgets/custom_text_field_widget.dart';

class FieldAndListOfFilteringItemSection extends StatelessWidget {
  const FieldAndListOfFilteringItemSection({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 12,
            left: 16,
            right: 16,
          ),
          child: CustomTextFieldWidget(
            textFieldModel: TextFieldModel(
              controller: _searchController,
              label: AppStrings.search,
              fillColor: AppColors.white,
              onChanged: (value) {},
              prefixIcon: Assets.imagesSearch,
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        const ListOfFilteringItem(),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
