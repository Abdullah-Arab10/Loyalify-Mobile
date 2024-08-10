import 'package:flutter/material.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/widgets/custom_container.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList(
      {super.key,
      this.scrollDirection,
      required this.itemCount,
      this.isAspectRatio = false,
      this.height,
      this.aspectRatio,
      this.topMargin = 0.0,
      this.leftMargin = 0.0,
      this.rightMargin,
      this.bottomMargin = 0.0,
      required this.itemBorderRadius});

  final Axis? scrollDirection;
  final int itemCount;
  final double topMargin;
  final double leftMargin;
  final double? rightMargin;
  final double bottomMargin;
  final bool isAspectRatio;
  final double? aspectRatio;
  final double? height;
  final double itemBorderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.white,
      highlightColor: AppColors.sonicSilver,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: scrollDirection ?? Axis.vertical,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return isAspectRatio
              ? AspectRatio(
                  aspectRatio: aspectRatio ?? 2 / 1,
                  child: CustomContainer(
                    bottomMargin: bottomMargin,
                    rightMargin: rightMargin ?? 0.0,
                    leftMargin: leftMargin,
                    topMargin: topMargin,
                    borderRadius: itemBorderRadius,
                  ),
                )
              : CustomContainer(
                  bottomMargin: bottomMargin,
                  rightMargin: rightMargin != null
                      ? rightMargin!
                      : index % 2 == 0
                          ? 70
                          : 0,
                  height: height,
                  leftMargin: leftMargin,
                  topMargin: topMargin,
                  borderRadius: itemBorderRadius,
                );
        },
      ),
    );
  }
}


