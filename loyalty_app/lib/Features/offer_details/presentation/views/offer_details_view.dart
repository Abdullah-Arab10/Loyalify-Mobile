import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loyalty_app/Features/offer_details/presentation/manager/fetch_offer_details_cubit/fetch_offer_details_cubit.dart';
import 'package:loyalty_app/Features/offer_details/presentation/views/widgets/offer_details_view_body.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/widgets/custom_app_bar.dart';
import 'package:loyalty_app/core/widgets/custom_icon.dart';

class OfferDetailsView extends StatefulWidget {
  const OfferDetailsView(
      {super.key, required this.userId, required this.offerId});

  final int userId;
  final String offerId;

  @override
  State<OfferDetailsView> createState() => _OfferDetailsViewState();
}

class _OfferDetailsViewState extends State<OfferDetailsView> {
  @override
  void initState() {
    BlocProvider.of<FetchOfferDetailsCubit>(context)
        .fetchOfferDetails(userId: widget.userId, offerId: widget.offerId);
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
        title: 'Offer Details',
        onTap: () {
          GoRouter.of(context).pop();
        },
      ),
      body: OfferDetailsViewBody(
        offerId: widget.offerId,
      ),
    );
  }
}
