import 'package:flutter/material.dart';
import 'package:loyalty_app/core/utils/app_colors.dart';
import 'package:loyalty_app/core/utils/app_styles.dart';
import 'package:loyalty_app/core/utils/size_config.dart';
import 'package:loyalty_app/core/utils/strings_manager.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: Text(
              AppStrings.loyalify,
              textAlign: TextAlign.center,
              style: AppStyles.styleBold29(context).copyWith(
                color: AppColors.white,
                fontSize: SizeConfig.width * 0.09,
              )
            ),
          );
        });
  }
}
