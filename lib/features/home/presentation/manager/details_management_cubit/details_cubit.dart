import 'package:carousel_slider_plus/carousel_controller.dart';
import 'package:e_commerce_app/features/home/presentation/manager/details_management_cubit/details_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsCubit extends Cubit<DetailsStates> {
  CarouselSliderController carouselController = CarouselSliderController();
  int detailsIndecator = 0;

  DetailsCubit() : super(DetailsInItState());
  static DetailsCubit get(context) => BlocProvider.of(context);

  void changeDetailsImages(int index) {
    detailsIndecator = index;
    emit(ChangeDetailsImagesState());
  }
}
