import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:loyalty_app/core/utils/app_router.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (context)=> const Loyalify()
    ));
}

class Loyalify extends StatelessWidget {
  const Loyalify({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
);
  }
}