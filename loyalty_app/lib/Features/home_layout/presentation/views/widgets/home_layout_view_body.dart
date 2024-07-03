import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/home_layout_cubit/home_layout_cubit.dart';

class HomeLayoutViewBody extends StatelessWidget {
  const HomeLayoutViewBody({super.key, required this.currentIndex});

  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return HomeLayoutCubit.get(context).screens[currentIndex];
  }
}
