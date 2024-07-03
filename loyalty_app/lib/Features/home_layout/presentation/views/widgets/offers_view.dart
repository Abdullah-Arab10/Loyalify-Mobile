import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/merchants_image.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/app_styles.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/utils/size_config.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return CustomScrollView(
      slivers: [
        SliverList.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) => Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(color: AppColors.lightGray, blurRadius: 8)
                  ]),
              clipBehavior: Clip.antiAlias,
              margin:
                  const EdgeInsetsDirectional.only(top: 24, start: 24, end: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
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
                        child: MerchantsImage(
                          image: Assets.imagesSss,
                          maxWidth: SizeConfig.width <= 800 ? 45 : 60,
                          decoration: const BoxDecoration(shape: BoxShape.circle),
                          clipBehavior: Clip.antiAlias,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text('Get Free 1 Cup Coffe E-Voucher',
                        style: AppStyles.styleBold20(context)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Text('3.750 points',
                            style: AppStyles.styleSemiBold16(context)
                                .copyWith(color: AppColors.sonicSilver)),
                        const SizedBox(
                          width: 16,
                        ),
                        Text('Starbucks',
                            style: AppStyles.styleSemiBold16(context)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
