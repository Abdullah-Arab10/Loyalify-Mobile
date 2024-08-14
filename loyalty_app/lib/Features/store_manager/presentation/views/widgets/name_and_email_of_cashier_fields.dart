import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/authentication/data/models/text_field_model.dart';
import 'package:loyalty_app/Features/store_manager/presentation/manager/add_cashier_cubit/add_cashier_cubit.dart';
import 'package:loyalty_app/core/resources/strings_manager.dart';
import 'package:loyalty_app/core/resources/values_manager.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/widgets/custom_text_field_widget.dart';

class NameAndEmailOfCashierFields extends StatefulWidget {
  const NameAndEmailOfCashierFields({
    super.key,
  });

  @override
  State<NameAndEmailOfCashierFields> createState() =>
      _NameAndEmailOfCashierFieldsState();
}

class _NameAndEmailOfCashierFieldsState
    extends State<NameAndEmailOfCashierFields> {
  late TextEditingController _nameOfCashierController;

  late TextEditingController _emailOfCashierController;

  bool isEmailOfCashierValid = true;

  bool isnameOfCashierValid = true;

  @override
  void initState() {
    _nameOfCashierController = TextEditingController();
    _emailOfCashierController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddCashierCubit, AddCashierState>(
      listener: (context, state) {
        if (state is NameOfCashierIsValid) {
          isnameOfCashierValid = true;
        } else if (state is NameOfCashierIsInValid) {
          isnameOfCashierValid = false;
        }
        if (state is EmailOfCashierIsValid) {
          isEmailOfCashierValid = true;
        } else if (state is EmailOfCashierIsInValid) {
          isEmailOfCashierValid = false;
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            CustomTextFieldWidget(
              textFieldModel: TextFieldModel(
                controller: _nameOfCashierController,
                label: 'Name Of Cashier',
                onChanged: (value) =>
                    AddCashierCubit.get(context).setNameOfCashier(value),
                error: (isnameOfCashierValid)
                    ? null
                    : 'Name Of Cashier must not be empty',
                prefixIcon: Assets.imagesAccount,
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height / AppPadding.p33),
            CustomTextFieldWidget(
              textFieldModel: TextFieldModel(
                controller: _emailOfCashierController,
                label: 'Email Of Cashier',
                onChanged: (value) =>
                    AddCashierCubit.get(context).setEmailOfCashier(value),
                error: (isEmailOfCashierValid) ? null : AppStrings.emailError,
                prefixIcon: Assets.imagesEmailOutlined,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _nameOfCashierController.dispose();
    _emailOfCashierController.dispose();
    super.dispose();
  }
}
