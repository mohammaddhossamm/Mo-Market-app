import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:e_commerce_app/features/onbording/presentation/manager/onbording_cubit/onbording_cubit.dart';
import 'package:e_commerce_app/features/onbording/presentation/view/widgets/onbording_widgets/onbording_list_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomPageIndicator extends StatelessWidget {
  const CustomPageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: OnBordingCubit.get(context).onbordingController,
      count: onBoardingModel(context).length,
      effect: const ExpandingDotsEffect(
        activeDotColor: AppColors.primary,
        dotColor: AppColors.grayColor,
        dotHeight: 10,
        dotWidth: 10,
        expansionFactor: 3,
        spacing: 5,
      ),
    );
  }
}