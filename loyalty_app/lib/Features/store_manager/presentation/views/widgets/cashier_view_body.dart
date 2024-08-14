import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/store_manager/presentation/manager/store_manager_cubit/store_manager_cubit.dart';
import 'package:loyalty_app/Features/store_manager/presentation/views/widgets/scan_qr_code_and_add_cost_widget.dart';
import 'package:loyalty_app/core/utils/app_images.dart';

class CashierViewBody extends StatefulWidget {
  const CashierViewBody({super.key});

  @override
  State<CashierViewBody> createState() => _CashierViewBodyState();
}

class _CashierViewBodyState extends State<CashierViewBody> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _totalCostController;
  bool isTotalCostValid = true;

  @override
  void initState() {
    _totalCostController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreManagerCubit, StoreManagerState>(
      listener: (context, state) {
        if (state is TotalCostIsValid) {
          isTotalCostValid = true;
        } else if (state is TotalCostIsInValid) {
          isTotalCostValid = false;
        }
      },
      builder: (context, state) {
        return ScanQrCodeAndAddCostWidget(
          formKey: _formKey,
          totalCostController: _totalCostController,
          isTotalCostValid: isTotalCostValid,
          state: state,
          image: Assets.imagesAccountant,
        );
      },
    );
  }

  @override
  void dispose() {
    _totalCostController.dispose();
    super.dispose();
  }
}
