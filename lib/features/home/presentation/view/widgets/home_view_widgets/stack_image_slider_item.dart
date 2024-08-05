import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/shared/widgets/custom_image_error.dart';
import 'package:e_commerce_app/features/home/data/models/home_model/home_model.dart';
import 'package:flutter/material.dart';

class StackImageSliderItem extends StatelessWidget {
  final HomeModel model;
  final int index;
  const StackImageSliderItem({super.key, required this.model, required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: AspectRatio(
        aspectRatio: 2 / 1,
        child: CachedNetworkImage(
          imageUrl: model.data!.banners![index].image??'',
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => const CustomImageError(),
        ),
      ),
    );
  }
}
