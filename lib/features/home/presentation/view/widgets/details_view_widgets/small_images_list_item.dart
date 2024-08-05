import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/features/home/presentation/manager/details_management_cubit/details_cubit.dart';
import 'package:flutter/material.dart';

class SmallImagesListItem extends StatelessWidget {
  const SmallImagesListItem({
    super.key,
    required this.index,
    required this.height,
    required this.imagesList,
    required this.boarderColor,
  });
  final int index;
  final List imagesList;
  final Color boarderColor;
  //This height not total height but ==> it equals = total Screen heigth / height
  final double height;
  @override
  Widget build(BuildContext context) {
    var detailsCubit = DetailsCubit.get(context);
    return GestureDetector(
      onTap: () {
        detailsCubit.changeDetailsImages(index);
        detailsCubit.carouselController.animateToPage(
          detailsCubit.detailsIndecator,
          curve: Curves.bounceIn,
        );
      },
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        padding: const EdgeInsets.all(2.5),
        decoration: BoxDecoration(
          color: boarderColor,
          borderRadius: BorderRadius.circular(5),
        ),
        height: MediaQuery.of(context).size.height / height,
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
            ),
            child: CachedNetworkImage(
              imageUrl: imagesList[index],
              fit: BoxFit.cover,
              errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error)),
            ),
          ),
        ),
      ),
    );
  }
}
