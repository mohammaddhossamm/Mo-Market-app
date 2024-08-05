import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/details_view_widgets/small_images_list_item.dart';
import 'package:flutter/material.dart';

Widget imagesListWidget({
  required i,
  required List imagesList,
}) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        imagesList.length,
        (index) {
          if (index == i) {
            return SmallImagesListItem(
              boarderColor: AppColors.primary,
              height: 14,
              index: index,
              imagesList: imagesList,
            );
          } else {
            return SmallImagesListItem(
              boarderColor:AppColors.lightWhite,
              height: 16,
              index: index,
              imagesList: imagesList,
            );
          }
        },
      ),
    ),
  );
}