import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/home_widgets/action_item.dart';
import 'package:loyalty_app/Features/offer_details/presentation/views/widgets/qr_code.dart';
import 'package:loyalty_app/core/utils/app_prefs.dart';
import 'package:loyalty_app/core/utils/service_locator.dart';

class ActionRow extends StatelessWidget {
  const ActionRow({super.key});

  @override
  Widget build(BuildContext context) {
    AppPreferences appPreferences = getIt.get<AppPreferences>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            appPreferences.logout();
          },
          child: const ActionItem(
            icon: Icons.receipt,
            label: 'Receipt Photo',
          ),
        ),
        const ActionItem(
          icon: Icons.assignment,
          label: 'Survey',
        ),
        InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: QRCode(
                    offerId: '',
                    userId: '4aaac0e9-b189-4219-bd7d-08dcbe350f93',
                  ),
                );
              },
            );
          },
          child: const ActionItem(
            icon: Icons.qr_code_scanner,
            label: 'Scan QR Code',
          ),
        ),
      ],
    );
  }
}
