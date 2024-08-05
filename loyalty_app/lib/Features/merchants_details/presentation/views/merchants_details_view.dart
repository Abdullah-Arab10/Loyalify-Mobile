import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loyalty_app/Features/merchants_details/presentation/manager/fetch_store_details_cubit/fetch_store_details_cubit.dart';
import 'package:loyalty_app/Features/merchants_details/presentation/views/widgets/merchants_details_view_body.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/widgets/custom_app_bar.dart';
import 'package:loyalty_app/core/widgets/custom_icon.dart';

class MerchantsDetailsView extends StatefulWidget {
  const MerchantsDetailsView({super.key, required this.storeId});

  final int storeId;

  @override
  State<MerchantsDetailsView> createState() => _MerchantsDetailsViewState();
}

class _MerchantsDetailsViewState extends State<MerchantsDetailsView> {
  @override
  void initState() {
    BlocProvider.of<FetchStoreDetailsCubit>(context).fetchStoreDetails(
      storeId: widget.storeId,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gainsboro,
      appBar: CustomAppBar(
        backgroundColor: AppColors.gainsboro,
        svgPicture: CustomIcon(
          image: Assets.imagesLeftArrow,
          color: AppColors.black,
          padding: 12,
        ),
        isTitle: true,
        title: 'Starbucks',
        isActions: true,
        icon: Assets.imagesMenu,
        onTap: () {
          GoRouter.of(context).pop();
        },
      ),
      body: MerchantsDetailsViewBody(
        storeId: widget.storeId,
      ),
    );
  }
}
