import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/home_widgets/action_item.dart';

class ActionRow extends StatelessWidget {
  const ActionRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ActionItem(
          icon: Icons.receipt,
          label: 'Receipt Photo',
        ),
        ActionItem(
          icon: Icons.assignment,
          label: 'Survey',
        ),
        ActionItem(
          icon: Icons.qr_code_scanner,
          label: 'Scan QR Code',
        ),
      ],
    );
  }
}
