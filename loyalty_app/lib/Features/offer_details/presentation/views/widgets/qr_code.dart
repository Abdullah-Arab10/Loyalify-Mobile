import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCode extends StatelessWidget {
  const QRCode({super.key, required this.offerId});

  final String offerId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const Text(
            'My QR Code',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Center(
              child: QrImageView(
                data: 'eaa20e56-593a-49c2-ed7a-08dcb55dce7b|$offerId',
                version: QrVersions.auto,
                size: 200.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
