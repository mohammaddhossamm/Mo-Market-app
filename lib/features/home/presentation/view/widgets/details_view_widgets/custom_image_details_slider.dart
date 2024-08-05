import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/shared/widgets/custom_carousel_slider.dart';
import 'package:e_commerce_app/core/shared/widgets/custom_image_error.dart';
import 'package:e_commerce_app/features/home/presentation/manager/details_management_cubit/details_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/details_management_cubit/details_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomImageDetailsSlider extends StatelessWidget {
    final List imagesList;
  const CustomImageDetailsSlider({super.key, required this.imagesList});

  @override
  Widget build(BuildContext context) {
    
    return BlocBuilder<DetailsCubit, DetailsStates>(
      builder: (context, state) {
        var detailsCubit= DetailsCubit.get(context);
        return CustomCarouselSlider(
          items: returnImagesList(imagesList),  
          carouselController: detailsCubit.carouselController,
          autoPlay: false,
          intialPage: detailsCubit.detailsIndecator,
          height: MediaQuery.of(context).size.height * 0.4,
          onPageChanged: (index, reason) {
            detailsCubit.changeDetailsImages(index);
          },
        );
        
      },
    );
  }
}

List<Widget>? returnImagesList(List imagesList) {
  List<Widget>? list = [];
  for (int i = 0; i < imagesList.length; i++) {
    list.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: CachedNetworkImage(
            imageUrl: imagesList[i],
            errorWidget: (context, url, error) => const CustomImageError(),
          ),
      ),
    );
  }
  return list;
}
