import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/offer_details/presentation/views/widgets/qr_code.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/app_styles.dart';
import 'package:loyalty_app/core/widgets/custom_button.dart';

class OfferDescriptionAndButtonSection extends StatelessWidget {
  const OfferDescriptionAndButtonSection({
    super.key,
    required this.description,
    required this.offerId, required this.userId,
  });

  final String description;
  final String userId;
  final String offerId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          description,
          style: AppStyles.styleSemiBold18(context).copyWith(
            color: AppColors.sonicSilver,
          ),
          textAlign: TextAlign.left,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Divider(
                height: 30,
                color: Color(0xffEEEEF1),
              ),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  foregroundColor: AppColors.white,
                  text: 'Redeem',
                  backgroundColor: AppColors.kPrimaryColor,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return Container(
                          padding: const EdgeInsets.all(16.0),
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: QRCode(offerId: offerId, userId: userId,),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
