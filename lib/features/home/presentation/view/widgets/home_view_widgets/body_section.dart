import 'package:e_commerce_app/core/shared/widgets/custom_error_widget.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/home_view_widgets/custom_home_grid_view.dart';
import 'package:e_commerce_app/core/shared/widgets/loading.dart';
import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:e_commerce_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/home_cubit/home_states.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/home_view_widgets/custom_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BodySection extends StatelessWidget {
  const BodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(builder: (context, state) {
      if (state is HomeErrorState) {
        return CustomErrorWidget(
          errorMessage: state.error,
          lottie: state.lattieError.toString(),
        );
      } else if (state is HomeSuccessState) {
        return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomImageSlider(),
            const SizedBox(
              height: 20,
            ),
            Text(
              AppLocalizations.of(context)!.products,
              style: Styles.textStyleBold16,
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomHomeGridView(),
          ],
        );
      } else {
        return const Loading();
      }
    });
  }
}
