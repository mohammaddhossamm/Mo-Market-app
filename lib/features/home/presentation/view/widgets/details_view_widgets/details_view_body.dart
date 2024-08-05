import 'package:e_commerce_app/core/shared/widgets/custom_button.dart';
import 'package:e_commerce_app/features/home/data/models/details_model/details_model.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/details_view_widgets/custom_bottom_sheet.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/details_view_widgets/custom_change_cart_button.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/details_view_widgets/name_and_details.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/details_view_widgets/stack_details_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailsViewBody extends StatelessWidget {
  final DetailsModel detailsModel;
  const DetailsViewBody({
    super.key,
    required this.detailsModel,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StackDetailsImage(
              imagesList: detailsModel.imagesList,
              productId: detailsModel.productId,
            ),
            NameAndDetailsProduct(
              productName: detailsModel.productName,
              productDescription: detailsModel.productDescription,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomButton(
                    textButton: AppLocalizations.of(context)!.buyNow,
                    onPressed: () {
                      customBottomSheet(
                        context,
                        price: detailsModel.price,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomChangeCartButton(
                    productId: detailsModel.productId,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
