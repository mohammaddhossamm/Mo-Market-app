import 'package:e_commerce_app/core/shared/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/home/presentation/manager/details_management_cubit/details_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/details_management_cubit/details_states.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/details_view_widgets/custom_image_details_slider.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/details_view_widgets/small_images_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StackDetailsImage extends StatelessWidget {
  final List imagesList;
  final int productId;
  const StackDetailsImage({
    super.key,
    required this.imagesList,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsStates>(
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Stack(
            children: [
              CustomImageDetailsSlider(
                imagesList: imagesList,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CustomAppBar(
                      text:   AppLocalizations.of(context)!.productDetails,
                      productId: productId,
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                      haveFavIcon: true,
                    ),
                    const Spacer(),
                    imagesList.isNotEmpty
                        ? imagesListWidget( 
                            i: DetailsCubit.get(context).detailsIndecator,
                            imagesList: imagesList,
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
