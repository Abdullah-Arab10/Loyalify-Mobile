import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loyalty_app/Features/authentication/data/models/text_field_model.dart';
import 'package:loyalty_app/Features/authentication/presentation/views/widgets/buttons_section.dart';
import 'package:loyalty_app/Features/store_manager/presentation/manager/store_manager_cubit/store_manager_cubit.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/app_router.dart';
import 'package:loyalty_app/core/resources/values_manager.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/utils/functions.dart';
import 'package:loyalty_app/core/widgets/custom_button.dart';
import 'package:loyalty_app/core/widgets/custom_svg_picture.dart';
import 'package:loyalty_app/core/widgets/custom_text_field_widget.dart';

class ScanQrCodeAndAddCostWidget extends StatelessWidget {
  const ScanQrCodeAndAddCostWidget(
      {super.key,
      this.bottomCenterText,
      this.textButtonOnPressed,
      required this.image});

  final String? bottomCenterText;
  final VoidCallback? textButtonOnPressed;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 32,
            right: 32,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSvgPicture(image: image, maxWidth: getMaxWidth(context)),
              Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height / 5),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      foregroundColor: AppColors.white,
                      text: 'Take Offer',
                      backgroundColor: AppColors.kPrimaryColor,
                      onPressed: () {
                        GoRouter.of(context)
                            .push(AppRouter.kScanCodeView, extra: false);
                      },
                    ),
                  ),
                  SizedBox(
                      height:
                          MediaQuery.of(context).size.height / AppPadding.p33),
                  ButtonsSection(
                    buttonText: 'Add Point',
                    bottomCenterText: bottomCenterText,
                    onPressed: () {
                      GoRouter.of(context)
                          .push(AppRouter.kScanCodeView, extra: true);
                    },
                    textButtonOnPressed: textButtonOnPressed,
                  ),
                  SizedBox(
                      height:
                          MediaQuery.of(context).size.height / AppPadding.p50),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
