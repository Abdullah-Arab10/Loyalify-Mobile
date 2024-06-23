import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loyalty_app/Features/authentication/presentation/views/widgets/login_view_body.dart';
import 'package:loyalty_app/core/utils/app_colors.dart';
import 'package:loyalty_app/core/utils/app_images.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
      elevation: 0,
      backgroundColor: AppColors.white,
      leading: GestureDetector(
        onTap: () {},
        child: Center(
          child: SvgPicture.asset(
            Assets.imagesLeftArrow,
            colorFilter: const ColorFilter.mode(
                Colors.black,
                 BlendMode.srcIn),
          ),
        ),
      ),
    ),
      body: LoginViewBody(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}


