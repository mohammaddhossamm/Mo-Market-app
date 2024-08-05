import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/shared/widgets/custom_fav_icon.dart';
import 'package:e_commerce_app/core/utls/app_routes.dart';
import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:e_commerce_app/features/home/data/models/details_model/details_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GridViewItem extends StatelessWidget {
  final DetailsModel detailsModel;
  const GridViewItem({
    super.key, required this.detailsModel,
    
  });
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRoutes.detailsView,
          extra: detailsModel,
        );
      },
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    CachedNetworkImage(
                      imageUrl: detailsModel.image,
                      height: double.infinity,
                      width: double.infinity,
                      errorWidget: (context, url, error) =>
                          const Center(child: Icon(Icons.error)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomFavIcon(
                        productId: detailsModel.productId,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 72,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 5),
                  Text(
                    detailsModel.productName,
                    style: Styles.textStyleNormal14,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        "\$${detailsModel.price}",
                        style: Styles.textStyleNormal14.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      detailsModel.discount != 0
                          ? Text(
                              "\$${detailsModel.oldPrice}",
                              style: Styles.textStyleNormal14.copyWith(
                                decoration: TextDecoration.lineThrough,
                                color: AppColors.grayColor,
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
