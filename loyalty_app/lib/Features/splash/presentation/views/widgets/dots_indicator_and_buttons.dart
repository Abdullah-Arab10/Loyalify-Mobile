import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/splash/presentation/views/widgets/dots_indicator.dart';
import 'package:loyalty_app/constants.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/strings_manager.dart';
import 'package:loyalty_app/core/widgets/custom_button.dart';

class DotsIndicatorAndButtons extends StatelessWidget {
  const DotsIndicatorAndButtons({
    super.key,
    required this.currentPageIndex, required this.text,
  });

  final int currentPageIndex;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Column(
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
                          backgroundColor: AppColors.white.withOpacity(0.9), onPressed: () {},
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
                    backgroundColor: kPrimaryColor, onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}