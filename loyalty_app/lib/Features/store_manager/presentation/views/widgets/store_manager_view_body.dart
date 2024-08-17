import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:loyalty_app/Features/store_manager/presentation/manager/store_manager_cubit/store_manager_cubit.dart';
import 'package:loyalty_app/Features/store_manager/presentation/views/widgets/scan_qr_code_and_add_cost_widget.dart';
import 'package:loyalty_app/core/resources/app_router.dart';
import 'package:loyalty_app/core/utils/app_images.dart';

class StoreManagerViewBody extends StatelessWidget {
  const StoreManagerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ScanQrCodeAndAddCostWidget(
      image: Assets.imagesManager,
      bottomCenterText: 'add cashier',
      textButtonOnPressed: () {
        GoRouter.of(context).push(AppRouter.kAddCashierView);
      },
    );
  }
}
