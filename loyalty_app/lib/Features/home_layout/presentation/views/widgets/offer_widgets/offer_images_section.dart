import 'package:flutter/material.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/utils/size_config.dart';
import 'package:loyalty_app/core/widgets/custom_image.dart';

class OfferImagesSection extends StatelessWidget {
  const OfferImagesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        AspectRatio(
          aspectRatio: 3 / 1,
          child: Image.asset(
            Assets.imagesTtt,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(6),
          child: CustomImage(
            image: Image.asset(Assets.imagesSss),
            maxWidth: SizeConfig.width <= 800 ? 45 : 60,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            clipBehavior: Clip.antiAlias,
            padding: 0,
            aspectRatio: 3 / 1,
          ),
        )
      ],
    );
  }
}
