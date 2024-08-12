import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/home_widgets/circular_notch_clipper.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';

class CircularPinkContainer extends StatelessWidget {
  const CircularPinkContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CircularNotchClipper(),
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).width <= 550 ? 305 : 325,
        color: AppColors.kPrimaryColor,
      ),
    );
  }
}
