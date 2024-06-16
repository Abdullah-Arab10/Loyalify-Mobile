import 'package:flutter/material.dart';
import 'package:loyalty_app/constants.dart';
import 'package:loyalty_app/core/utils/app_royter.dart';

void main() {
  runApp(const Loyalify());
}

class Loyalify extends StatelessWidget {
  const Loyalify({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimaryColor,
      ),
);
  }
}