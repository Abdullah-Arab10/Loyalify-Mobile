import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loyalty_app/Features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:loyalty_app/core/utils/app_colors.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/utils/size_config.dart';

class LogoAndSlidingText extends StatelessWidget {
  const LogoAndSlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;
  
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.imagesLogo,
            colorFilter: ColorFilter.mode(
              AppColors.white,
               BlendMode.srcIn),
               width: SizeConfig.width * 0.43,
               height: SizeConfig.width * 0.43,
            ),
          SlidingText(slidingAnimation: slidingAnimation),
        ],
      ),
    );
  }
}