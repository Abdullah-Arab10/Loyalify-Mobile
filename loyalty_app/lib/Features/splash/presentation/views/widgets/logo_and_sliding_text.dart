import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loyalty_app/Features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:loyalty_app/core/utils/app_images.dart';

class LogoAndSlidingText extends StatelessWidget {
  const LogoAndSlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.imagesLogo,
            colorFilter: const ColorFilter.mode(
              Colors.white,
               BlendMode.srcIn),
               width: 175,
               height: 175,
            ),
          SlidingText(slidingAnimation: slidingAnimation),
        ],
      ),
    );
  }
}