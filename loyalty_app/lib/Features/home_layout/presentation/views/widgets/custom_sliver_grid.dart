import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/app_styles.dart';
import 'package:loyalty_app/core/utils/app_images.dart';

class CustomSliverGrid extends StatelessWidget {
  const CustomSliverGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 70),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: const ShapeDecoration(
                        shape: OvalBorder(),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          Assets.imagesLogo,
                          colorFilter: ColorFilter.mode(
                              AppColors.kPrimaryColor, BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Loyalify',
                  style: AppStyles.styleBold20(context),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Food & Drinks',
                  style: AppStyles.styleSemiBold16(context),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
