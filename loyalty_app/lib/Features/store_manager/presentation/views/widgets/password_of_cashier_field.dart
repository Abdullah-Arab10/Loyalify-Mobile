import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/authentication/data/models/text_field_model.dart';
import 'package:loyalty_app/Features/store_manager/presentation/manager/add_cashier_cubit/add_cashier_cubit.dart';
import 'package:loyalty_app/core/manager/eye_visibility_cubit/eye_visibility_cubit.dart';
import 'package:loyalty_app/core/resources/strings_manager.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/widgets/custom_text_field_widget.dart';

class PasswordOfCashierField extends StatefulWidget {
  const PasswordOfCashierField({super.key});

  @override
  State<PasswordOfCashierField> createState() => _PasswordOfCashierFieldState();
}

class _PasswordOfCashierFieldState extends State<PasswordOfCashierField> {
  late TextEditingController _passwordCashierController;

  bool isPasswordOfCashierValid = true;

  @override
  void initState() {
    _passwordCashierController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddCashierCubit, AddCashierState>(
      listener: (context, state) {
        if (state is PasswordOfCashierIsValid) {
          isPasswordOfCashierValid = true;
        } else if (state is PasswordOfCashierIsInValid) {
          isPasswordOfCashierValid = false;
        }
      },
      builder: (context, state) {
        return BlocBuilder<EyeVisibilityCubit, EyeVisibilityState>(
          builder: (context, state) {
            return CustomTextFieldWidget(
              textFieldModel: TextFieldModel(
                controller: _passwordCashierController,
                keyboardType: TextInputType.visiblePassword,
                label: 'Password Of Cashier',
                onChanged: (value) =>
                    AddCashierCubit.get(context).setPasswordOfCashier(value),
                error: (isPasswordOfCashierValid)
                    ? null
                    : AppStrings.passwordError,
                prefixIcon: Assets.imagesLockOutlined,
                obscureText: EyeVisibilityCubit.get(context).isPassword,
                suffixPressed:
                    EyeVisibilityCubit.get(context).changePasswordVisibility,
                suffixIcon: EyeVisibilityCubit.get(context).suffix,
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _passwordCashierController.dispose();
    super.dispose();
  }
}
