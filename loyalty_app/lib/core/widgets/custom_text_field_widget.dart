import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/authentication/data/models/text_field_model.dart';
import 'package:loyalty_app/core/utils/app_colors.dart';
import 'package:loyalty_app/core/utils/app_styles.dart';
import 'package:loyalty_app/core/widgets/customIcon.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextFieldModel textFieldModel;

  const CustomTextFieldWidget({
    super.key,
    required this.textFieldModel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        controller: textFieldModel.controller,
        keyboardType: textFieldModel.keyboardType,
        style: AppStyles.styleMedium18(context),
        cursorColor: AppColors.black,
        obscureText: textFieldModel.obscureText,
        decoration: customInputDecoration(context),
        initialValue: textFieldModel.initial,
        onChanged: textFieldModel.onChanged,
        enabled: textFieldModel.enable,
      ),
    );
  }

  InputDecoration customInputDecoration(BuildContext context) {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.grey1,
      labelText: textFieldModel.label,
      labelStyle: AppStyles.styleMedium20(context).copyWith(
        color: AppColors.grey,
      ),
      errorText: textFieldModel.error,
      errorMaxLines: 3,
      errorStyle: AppStyles.styleRegular16(context).copyWith(
        color: AppColors.kPrimaryColor
      ),
      prefixIcon: CustomIcon(
        image: textFieldModel.prefixIcon, color: AppColors.grey600,
      ),
      suffixIcon: textFieldModel.suffixIcon != null
          ? GestureDetector(
              onTap: textFieldModel.suffixPressed,
              child: CustomIcon(
                image: textFieldModel.suffixIcon!, color: AppColors.grey600,
              ))
          : null,
      enabledBorder: customOutlineInputBorder(),
      focusedBorder: customOutlineInputBorder(),
      errorBorder: customOutlineInputBorder(),
      focusedErrorBorder:
          customOutlineInputBorder(color: AppColors.kPrimaryColor),
    );
  }

  OutlineInputBorder customOutlineInputBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: color ?? AppColors.grey1,
        width: 1.5,
      ),
    );
  }
}
