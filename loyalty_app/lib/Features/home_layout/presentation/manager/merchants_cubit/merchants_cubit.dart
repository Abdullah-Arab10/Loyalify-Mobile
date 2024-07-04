import 'package:flutter_bloc/flutter_bloc.dart';
part 'merchants_state.dart';

class MerchantsCubit extends Cubit<MerchantsState> {
  MerchantsCubit() : super(MerchantsInitialState());

  static MerchantsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndexOfItemState());
  }
}
