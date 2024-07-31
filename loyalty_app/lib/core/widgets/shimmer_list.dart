import 'package:flutter/material.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key, this.scrollDirection});

  final Axis? scrollDirection;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.white,
      highlightColor: AppColors.sonicSilver,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: scrollDirection ?? Axis.vertical,
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                EdgeInsets.only(bottom: 50, right: index % 2 == 0 ? 70 : 0),
            child: SizedBox(
              height: 10,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
