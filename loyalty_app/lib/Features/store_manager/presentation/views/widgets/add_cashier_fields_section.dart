import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/store_manager/presentation/views/widgets/name_and_email_of_cashier_fields.dart';
import 'package:loyalty_app/Features/store_manager/presentation/views/widgets/password_of_cashier_field.dart';
import 'package:loyalty_app/core/resources/values_manager.dart';

class AddCashierFieldsSection extends StatelessWidget {
  const AddCashierFieldsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const NameAndEmailOfCashierFields(),
        SizedBox(height: MediaQuery.of(context).size.height / AppPadding.p33),
        const PasswordOfCashierField(),
      ],
    );
  }
}
