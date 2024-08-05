import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/shared/widgets/custom_error_widget.dart';
import 'package:e_commerce_app/core/shared/widgets/empty_screen.dart';
import 'package:e_commerce_app/core/shared/widgets/grid_view_item.dart';
import 'package:e_commerce_app/core/utls/assets.dart';
import 'package:e_commerce_app/features/home/data/models/details_model/details_model.dart';
import 'package:e_commerce_app/features/wishlist/presentation/manager/wishlist_cubit/wishlist_cubit.dart';
import 'package:e_commerce_app/features/wishlist/presentation/manager/wishlist_cubit/wishlist_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce_app/core/shared/widgets/loading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomWishListGridView extends StatelessWidget {
  const CustomWishListGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistStates>(
      builder: (context, state) {
        switch (state) {
          case WishlistErrorState():
            return CustomErrorWidget(
              errorMessage: state.error,
              lottie: state.lottie,
            );
          case WishlistSuccessState():
            return kWishListModel!.data!.data!.isNotEmpty
                ? GridView.count(
                    crossAxisCount: 2,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 1.5,
                    crossAxisSpacing: 1.5,
                    childAspectRatio: 1 / 1.4,
                    shrinkWrap: true,
                    children: List.generate(
                      kWishListModel?.data?.data?.length ?? 0,
                      (index) {
                        var product =
                            kWishListModel?.data?.data?[index].products;
                        return GridViewItem(
                          detailsModel: DetailsModel(
                            image: product?.image ?? '',
                            oldPrice: product?.oldPrice ?? 000,
                            price: product?.price ?? 0000,
                            productName: product?.name ?? AppLocalizations.of(context)!.product,
                            discount: product?.discount ?? 0,
                            imagesList:
                                product?.image != null ? [product?.image] : [],
                            productDescription: product?.description ??
                                AppLocalizations.of(context)!.emptyProduct,
                            productId: product!.id!,
                          ),
                        );
                      },
                    ),
                  )
                :  EmptyScreen(
                    image: AssetsData.emptyWishlist,
                    text: AppLocalizations.of(context)!.emptyWishlist,
                  );
          case AddToWishListErrorState():
            return CustomErrorWidget(
              errorMessage: state.error,
              lottie: state.lottie,
            );
          
          default:
            return const Loading();
        }
      },
    );
  }
}
