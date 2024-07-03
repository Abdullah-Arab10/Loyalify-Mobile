import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/splash/presentation/views/widgets/onboarding_view_body.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white, body: const OnboardingViewBody());
  }
}
