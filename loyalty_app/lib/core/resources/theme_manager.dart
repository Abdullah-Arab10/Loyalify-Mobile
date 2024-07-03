import 'package:flutter/material.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/material_colors_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: AppColors.kPrimaryColor,
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: buildMaterialColor(AppColors.kPrimaryColor)),
  );
}
