
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loyalty_app/core/utils/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.foregroundColor,
    required this.text,
    required this.backgroundColor,
  });

  final Color foregroundColor;
  final Color backgroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      ),
      child: Text(
        text,
        style: AppStyles.styleBold18(context),
      ),
    );
  }
}