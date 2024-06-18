import 'package:flutter/material.dart';
import 'package:loyalty_app/core/utils/app_colors.dart';

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0), // Adjust the padding as needed
      child: SizedBox(
        width: 50, // Width of the CircularProgressIndicator
        height: 50, // Height of the CircularProgressIndicator
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.white), // Customize color
          strokeWidth: 6.0, // Customize the border width
        ),
      ),
    );
  }
}