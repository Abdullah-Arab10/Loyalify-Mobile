import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/home_widgets/action_item.dart';
import 'package:loyalty_app/Features/offer_details/presentation/views/widgets/qr_code.dart';
import 'package:loyalty_app/core/resources/app_router.dart';
import 'package:loyalty_app/core/utils/app_prefs.dart';
import 'package:loyalty_app/core/utils/service_locator.dart';

class ActionRow extends StatefulWidget {
  const ActionRow({super.key});

  @override
  State<ActionRow> createState() => _ActionRowState();
}

class _ActionRowState extends State<ActionRow> {
  
  final AppPreferences appPreferences = getIt.get<AppPreferences>();
  String userId = '';

  @override
  void initState() {
    appPreferences.getToken().then((value){
      userId = JwtDecoder.decode(value)['sub'];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppPreferences appPreferences = getIt.get<AppPreferences>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            appPreferences.logout();
            GoRouter.of(context).go(AppRouter.kOnboardingView);
          },
          child: const ActionItem(
            icon: Icons.logout_rounded,
            label: 'Log Out',
          ),
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
                    userId: userId,
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
