import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/app_router.dart';
import 'package:loyalty_app/core/resources/values_manager.dart';
import 'package:loyalty_app/core/widgets/custom_text_button.dart';
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
            onPressed: () {
              GoRouter.of(context).go(AppRouter.kLoginView);
            },
            text: bottomCenterText,
          ),
        ),
      ],
    );
  }
}
