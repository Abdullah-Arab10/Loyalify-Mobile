import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/authentication/data/models/text_field_model.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/merchants_cubit/merchants_category_cubit/merchants_category_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/merchants_widgets/list_of_filtering_item.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/app_styles.dart';
import 'package:loyalty_app/core/resources/strings_manager.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/widgets/custom_text_field_widget.dart';
import 'package:loyalty_app/core/widgets/shimmer_row.dart';

class FieldAndListOfFilteringItemSection extends StatelessWidget {
  const FieldAndListOfFilteringItemSection({
    super.key,
    required this.searchController,
    required this.onFieldSubmitted,
    required this.fetchOrSearch,
  });

  final TextEditingController searchController;
  final ValueChanged<String> onFieldSubmitted;
  final bool fetchOrSearch;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 12,
            left: 16,
            right: 16,
          ),
          child: CustomTextFieldWidget(
            textFieldModel: TextFieldModel(
              controller: searchController,
              label: AppStrings.search,
              fillColor: AppColors.white,
              onFieldSubmitted: onFieldSubmitted,
              prefixIcon: Assets.imagesSearch,
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        BlocBuilder<MerchantsCategoryCubit, MerchantsCategoryState>(
          builder: (context, state) {
            return state is FetchCategoriesSuccess
                ? ListOfFilteringItem(
                    items: state,
                    fetchOrSearch: fetchOrSearch,
                  )
                : state is FetchCategoriesFailure
                    ? Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          state.errMessage,
                          style: AppStyles.styleSemiBold20(context),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : const ShimmerRow();
          },
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
