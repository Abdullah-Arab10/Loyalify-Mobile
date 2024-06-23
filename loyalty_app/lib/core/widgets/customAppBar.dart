import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loyalty_app/core/utils/app_colors.dart';
import 'package:loyalty_app/core/utils/app_images.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
  
  @override
  Size get preferredSize => throw UnimplementedError();
}