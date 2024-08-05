import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/shared/widgets/custom_image_error.dart';
import 'package:e_commerce_app/core/utls/app_routes.dart';
import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:e_commerce_app/features/home/data/models/details_model/details_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchListViewItem extends StatelessWidget {
  final String imageUrl;
  final int productId;
  final List imagesList;
  final String productName;
  final String productDescription;
  final num price;
  const SearchListViewItem({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.price,
    required this.productDescription,
    required this.productId,
    required this.imagesList,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRoutes.detailsView,
            extra: DetailsModel(
              price: price,
              productName: productName,
              productDescription: productDescription,
              imagesList: imagesList,
              productId: productId,
              image: imageUrl,
              oldPrice: 0,
              discount: 0,
            ));
      },
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                color: Colors.white,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  errorWidget: (context, url, error) => const CustomImageError(),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: Styles.textStyleBold14,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    productDescription,
                    style: Styles.textStyleNormal14,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      '\$ $price',
                      style: Styles.textStyleBold14.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
