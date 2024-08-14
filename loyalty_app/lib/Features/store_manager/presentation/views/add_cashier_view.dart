import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loyalty_app/Features/store_manager/presentation/views/widgets/add_cashier_view_body.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/widgets/custom_app_bar.dart';
import 'package:loyalty_app/core/widgets/custom_icon.dart';

class AddCashierView extends StatelessWidget {
  const AddCashierView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        backgroundColor: /*state is AuthLoadingState
                    ? const Color(0xffE2E2E2)
                    :*/
            AppColors.white,
        svgPicture: CustomIcon(
          image: Assets.imagesLeftArrow,
          color: AppColors.black,
          padding: 12.0,
        ),
        onTap: () {
          GoRouter.of(context).pop();
        },
        isTitle: true,
        title: 'Add Cashier',
        // isActions: true,
        // icon: Assets.imagesQrCodeScan,
        // actionsOnTap: () {},
      ),
      body: const AddCashierViewBody(),
    );
  }
}
