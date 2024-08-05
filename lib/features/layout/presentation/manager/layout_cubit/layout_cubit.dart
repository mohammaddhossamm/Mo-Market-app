import 'package:e_commerce_app/features/layout/presentation/manager/layout_cubit/layout_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  int navBarCurrentIndex = 0;
  
  LayoutCubit() : super(LayoutInItState());
  static LayoutCubit get(context) => BlocProvider.of(context);

  void changeNavBarIndex(int index) {
    navBarCurrentIndex=index;
    emit(ChangeNavBarState());
  }
}
