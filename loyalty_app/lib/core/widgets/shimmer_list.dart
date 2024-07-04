import 'package:flutter/material.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/widgets/shimmer_placeholder.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key});

  static const List<CategoryShimmer> items = [
    CategoryShimmer(),
    CategoryShimmer(),
    CategoryShimmer(),
    CategoryShimmer(),
    CategoryShimmer(),
    CategoryShimmer(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.white,
      highlightColor: AppColors.sonicSilver,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(left: 2, right: 16),
          child: SizedBox(
            height: 37,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items.map((e) {
                return Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: e,
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerPlaceholder(
      aspectRatio: 2 / 1,
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 14, vertical: 8),
      borderRadius: BorderRadius.circular(30.0),
    );
  }
}
