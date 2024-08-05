import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/shared/widgets/grid_view_item.dart';
import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:e_commerce_app/features/home/data/models/details_model/details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomHomeGridView extends StatelessWidget {
  const CustomHomeGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.lightWhite,
      child: GridView.count(
        crossAxisCount: 2,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 1.5,
        crossAxisSpacing: 1.5,
        childAspectRatio: 1 / 1.4,
        shrinkWrap: true,
        children: List.generate(
          kHomeModel?.data?.products?.length ?? 0,
          (index) {
            return GridViewItem(
              detailsModel: DetailsModel(
                image: kHomeModel?.data?.products?[index].image ?? '',
                oldPrice: kHomeModel?.data?.products![index].oldPrice ?? 0000,
                price: kHomeModel?.data?.products?[index].price ?? 0000,
                productName: kHomeModel?.data?.products?[index].name ??
                    AppLocalizations.of(context)!.product,
                discount: kHomeModel?.data?.products?[index].discount ?? 0,
                imagesList: kHomeModel?.data?.products?[index].imagesList ?? [],
                productDescription:
                    kHomeModel?.data?.products?[index].description ??
                        AppLocalizations.of(context)!.noDetailsProdact,
                //product id
                productId: kHomeModel!.data!.products![index].id!,
              ),
            );
          },
        ),
      ),
    );
  }
}
