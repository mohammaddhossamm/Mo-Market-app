import 'package:e_commerce_app/features/onbording/presentation/manager/onbording_cubit/onbording_cubit.dart';
import 'package:e_commerce_app/features/onbording/presentation/manager/onbording_cubit/onbording_states.dart';
import 'package:e_commerce_app/features/onbording/presentation/view/widgets/onbording_widgets/onbording_list_model.dart';
import 'package:e_commerce_app/features/onbording/presentation/view/widgets/onbording_widgets/page_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBordingCubit,OnBordingStates>(
      builder: (context, state) {
        var cubit = OnBordingCubit.get(context);
        return PageView.builder(
      controller: cubit.onbordingController,
      itemBuilder: (context, index) =>  PageViewItem( model:  onBoardingModel(context)[index],),
      itemCount: onBoardingModel(context).length,
      onPageChanged: (value) {
        if (value == onBoardingModel(context).length - 1) {
         cubit.onBordingFinished(true);
        } else {
         cubit.onBordingFinished(false);
        }
      },
          );
      },
    );
  }
}