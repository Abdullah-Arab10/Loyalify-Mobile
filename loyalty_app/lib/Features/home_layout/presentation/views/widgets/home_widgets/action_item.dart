import 'package:flutter/material.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';

class ActionItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const ActionItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: Color(0xffFEF0F2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: AppColors.kPrimaryColor,
            size: 30,
          ),
        ),
        const SizedBox(height: 8),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}