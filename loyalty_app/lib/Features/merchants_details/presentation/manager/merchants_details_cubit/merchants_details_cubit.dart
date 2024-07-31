import 'package:flutter_bloc/flutter_bloc.dart';
part 'merchants_details_state.dart';

class MerchantsDetailsCubit extends Cubit<MerchantsDetailsState> {
  MerchantsDetailsCubit()
      : super(MerchantsDetailsInitial());

  static MerchantsDetailsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndexOfItemState());
  }
}
