import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/authentication/presentation/manager/auth_validation_cubit/auth_validation_cubit.dart';
import 'package:loyalty_app/core/utils/app_colors.dart';
import 'package:loyalty_app/core/utils/strings_manager.dart';
import 'package:loyalty_app/core/utils/values_manager.dart';
import 'package:loyalty_app/core/widgets/customTextButton.dart';
import 'package:loyalty_app/core/widgets/custom_button.dart';

class ButtonsSection extends StatelessWidget {
  const ButtonsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<AuthValidationCubit, AuthValidationState>(
          builder: (context, state) {
            return SizedBox(
              width: double.infinity,
              child: CustomButton(
                foregroundColor: AppColors.white,
                text: AppStrings.login,
                backgroundColor: AppColors.kPrimaryColor,
                onPressed: (state is AllDataIsValid)
                    ? () {}
                    : null,
              ),
            );
          },
        ),
        SizedBox(height: MediaQuery.of(context).size.height / AppPadding.p16),
        Align(
          alignment: Alignment.center,
          child: CustomTextButton(
            onPressed: () {},
            text: AppStrings.createAnAccount,
          ),
        ),
      ],
    );
  }
}
