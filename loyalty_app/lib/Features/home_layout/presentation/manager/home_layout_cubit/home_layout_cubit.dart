import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/merchants_view.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/offers_view.dart';
part 'home_layout_state.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutState> {
  HomeLayoutCubit() : super(HomeInitialState());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeIndex(context, int index) {
    currentIndex = index;
    emit(HomeBottomNavState());
  }

  List<Widget> screens = [
    const SizedBox(),
    const MerchantsView(),
    const OffersView(),
    const SizedBox(),
    const SizedBox(),
  ];
}
