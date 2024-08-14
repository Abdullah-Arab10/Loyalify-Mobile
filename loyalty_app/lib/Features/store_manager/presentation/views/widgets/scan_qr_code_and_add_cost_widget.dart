import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/authentication/data/models/text_field_model.dart';
import 'package:loyalty_app/Features/authentication/presentation/views/widgets/buttons_section.dart';
import 'package:loyalty_app/Features/store_manager/presentation/manager/store_manager_cubit/store_manager_cubit.dart';
import 'package:loyalty_app/core/resources/values_manager.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/utils/functions.dart';
import 'package:loyalty_app/core/widgets/custom_svg_picture.dart';
import 'package:loyalty_app/core/widgets/custom_text_field_widget.dart';

class ScanQrCodeAndAddCostWidget extends StatelessWidget {
  const ScanQrCodeAndAddCostWidget(
      {super.key,
      required this.formKey,
      required this.totalCostController,
      required this.isTotalCostValid,
      required this.state,
      this.bottomCenterText,
      this.textButtonOnPressed,
      required this.image});

  final GlobalKey formKey;
  final TextEditingController totalCostController;
  final bool isTotalCostValid;
  final dynamic state;
  final String? bottomCenterText;
  final VoidCallback? textButtonOnPressed;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 32,
              right: 32,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomSvgPicture(
                    image: image,
                    maxWidth: getMaxWidth(context)),
                Column(
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height /
                            AppPadding.p14),
                    CustomTextFieldWidget(
                      textFieldModel: TextFieldModel(
                        controller: totalCostController,
                        label: 'Total Cost',
                        keyboardType: TextInputType.number,
                        onChanged: (value) =>
                            StoreManagerCubit.get(context).setTotalCost(value),
                        error: (isTotalCostValid)
                            ? null
                            : 'total cost must not be empty',
                        prefixIcon: Assets.imagesDollarSign,
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height /
                            AppPadding.p10),
                    ButtonsSection(
                      buttonText: 'Add Total Cost',
                      bottomCenterText: bottomCenterText,
                      onPressed: (state is AllDataIsValid) ? () {} : null,
                      textButtonOnPressed: textButtonOnPressed,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
