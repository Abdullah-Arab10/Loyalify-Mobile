import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loyalty_app/Features/splash/presentation/views/widgets/dots_indicator.dart';
import 'package:loyalty_app/constants.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/app_router.dart';
import 'package:loyalty_app/core/resources/strings_manager.dart';
import 'package:loyalty_app/core/widgets/custom_button.dart';

class DotsIndicatorAndButtons extends StatelessWidget {
  const DotsIndicatorAndButtons({
    super.key,
    required this.currentPageIndex, required this.text, required this.onPressed,
  });

  final int currentPageIndex;
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DotsIndicator(currentPageIndex: currentPageIndex),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              currentPageIndex != 2
                  ? Expanded(
                      child: CustomButton(
                        foregroundColor: kPrimaryColor,
                        text: AppStrings.skip,
                        backgroundColor: AppColors.white.withOpacity(0.9), onPressed: () {
                          GoRouter.of(context).go(AppRouter.kRegisterView);
                        },
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: CustomButton(
                  foregroundColor: AppColors.white,
                  text: text,
                  backgroundColor: kPrimaryColor, onPressed: onPressed,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}