import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/splash/presentation/views/widgets/splash_view_body.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: const SplashViewbody(),
    );
  }
}
