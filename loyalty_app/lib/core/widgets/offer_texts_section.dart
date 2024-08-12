import 'package:flutter/material.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/app_styles.dart';

class OfferTextsSection extends StatelessWidget {
  const OfferTextsSection({
    super.key,
    required this.offerName,
    required this.text1,
    required this.text2,
    this.style1,
    this.style2,
    this.spacerBetweenText1AndText2,
    this.leftPadding,
  });

  final String offerName;
  final String text1;
  final String text2;
  final TextStyle? style1;
  final TextStyle? style2;
  final Widget? spacerBetweenText1AndText2;
  final double? leftPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: leftPadding ?? 10, right: 10),
          child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(offerName, style: AppStyles.styleBold20(context))),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.only(left: leftPadding ?? 10),
          child: Row(
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(text1,
                    style: style1 ??
                        AppStyles.styleSemiBold16(context)
                            .copyWith(color: AppColors.sonicSilver)),
              ),
              spacerBetweenText1AndText2 ??
                  const SizedBox(
                    width: 16,
                  ),
              FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(text2,
                      style: style2 ?? AppStyles.styleSemiBold16(context))),
            ],
          ),
        ),
      ],
    );
  }
}
