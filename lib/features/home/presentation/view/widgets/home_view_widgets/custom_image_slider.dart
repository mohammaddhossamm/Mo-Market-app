import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/shared/widgets/custom_carousel_slider.dart';
import 'package:e_commerce_app/features/home/presentation/manager/image_slider_indecator_cubit/image_slider_indecator_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/image_slider_indecator_cubit/image_slider_indecator_states.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/home_view_widgets/custom_indecator.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/home_view_widgets/stack_image_slider_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomImageSlider extends StatelessWidget {
  const CustomImageSlider({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageSliderIndecatorCubit(),
      child: BlocBuilder<ImageSliderIndecatorCubit, ImageSliderIndecatorStates>(
        builder: (context, state) {
          var indecatorCubit = ImageSliderIndecatorCubit.get(context);
          return Column(
            children: [
              CustomCarouselSlider(
                items: returnImagesList(),
                onPageChanged: (index, reason) {
                  indecatorCubit.changeHomeIndecator(index);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: customIndecatpr(
                  index: indecatorCubit.homViewIndecator,
                  length: kHomeModel!.data!.banners!.length,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

List<Widget>? returnImagesList() {
  List<Widget>? list = [];
  for (int i = 0; i < kHomeModel!.data!.banners!.length; i++) {
    list.add(
      StackImageSliderItem(
        model: kHomeModel!,
        index: i,
      ),
    );
  }
  return list;
}
