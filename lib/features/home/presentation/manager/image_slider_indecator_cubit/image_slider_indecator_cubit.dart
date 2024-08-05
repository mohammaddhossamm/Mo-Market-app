import 'package:e_commerce_app/features/home/presentation/manager/image_slider_indecator_cubit/image_slider_indecator_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageSliderIndecatorCubit extends Cubit<ImageSliderIndecatorStates>{
  int homViewIndecator = 0;
  ImageSliderIndecatorCubit():super(InItIndecatorState());
    static ImageSliderIndecatorCubit get(context) => BlocProvider.of(context);


    void changeHomeIndecator(int index) {
    homViewIndecator=index; 
    emit(ChangeImagendecatorState());
  }
}