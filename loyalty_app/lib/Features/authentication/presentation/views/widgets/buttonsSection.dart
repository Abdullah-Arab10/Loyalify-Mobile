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
    super.key, required this.buttonText, required this.bottomCenterText, this.onPressed,
  });

  final String buttonText;
  final String bottomCenterText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: CustomButton(
            foregroundColor: AppColors.white,
            text: buttonText,
            backgroundColor: AppColors.kPrimaryColor,
            onPressed: onPressed,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height / AppPadding.p22),
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomTextButton(
            onPressed: () {},
            text: bottomCenterText,
          ),
        ),
      ],
    );
  }
}
