import 'package:e_commerce_app/features/onbording/presentation/manager/onbording_cubit/onbording_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBordingCubit extends Cubit<OnBordingStates> {
  PageController onbordingController = PageController();
  bool isLast = false;

  OnBordingCubit():super(OnBordingInItState());
  static OnBordingCubit get(context) => BlocProvider.of(context);

void onBordingFinished(bool isLast) {
    this.isLast=isLast; 
    emit(ChangeOnBoardingState());
  } 
}
