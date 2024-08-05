import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/merchants_details/presentation/manager/fetch_store_details_cubit/fetch_store_details_cubit.dart';
import 'package:loyalty_app/Features/merchants_details/presentation/views/widgets/info_page.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/widgets/custom_no_data_or_failure.dart';
import 'package:loyalty_app/core/widgets/shimmer_list.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({
    super.key,
    required this.state,
  });

  final dynamic state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        state is FetchStoreDetailsSuccess
            ? InfoPage(
                storeDetailsModel:
                    FetchStoreDetailsCubit.get(context).storeDetailsModel,
              )
            : state is FetchStoreDetailsFailure
                ? CustomNoDataOrFailure(
                    text: state.errMessage, image: Assets.imagesFailure)
                : const ShimmerList(
                    itemCount: 20,
                    bottomMargin: 50,
                    itemBorderRadius: 30,
                  ),
      ],
    );
  }
}
