import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/authentication/presentation/views/widgets/register_view_body.dart';
import 'package:loyalty_app/core/utils/app_colors.dart';
import 'package:loyalty_app/core/widgets/custom_app_bar.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

@override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(),
      body: RegisterViewBody(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}