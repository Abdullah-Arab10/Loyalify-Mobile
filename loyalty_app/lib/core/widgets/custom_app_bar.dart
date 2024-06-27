import 'package:flutter/material.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/app_styles.dart';
import 'package:loyalty_app/core/resources/strings_manager.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key, required this.backgroundColor, required this.svgPicture, this.onTap, this.isTitle, this.isActions,
  });

final bool? isTitle;
final bool? isActions;
final Color backgroundColor;
final CustomIcon svgPicture;
final GestureTapCallback? onTap;
  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0.0,
      elevation: 0,
      backgroundColor: backgroundColor,
      leading: GestureDetector(
        onTap: onTap,
        child: Center(
          child: svgPicture,
        ),
      ),
      title: isTitle != null ? Align(
        alignment: Alignment.center,
        child: Text(
                AppStrings.merchants,
                style: AppStyles.styleBold29(context),
              ),
      ) : null,
    actions: isActions != null ? [
      CustomIcon(image: Assets.imagesMenu, color: AppColors.black,)
    ] : null,
    );
  }
}
