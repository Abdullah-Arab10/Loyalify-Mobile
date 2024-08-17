import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/store_manager/presentation/manager/store_manager_cubit/store_manager_cubit.dart';
import 'package:loyalty_app/Features/store_manager/presentation/views/widgets/scan_qr_code_and_add_cost_widget.dart';
import 'package:loyalty_app/core/utils/app_images.dart';

class CashierViewBody extends StatelessWidget {
  const CashierViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScanQrCodeAndAddCostWidget(
      image: Assets.imagesAccountant,
    );
  }
}
