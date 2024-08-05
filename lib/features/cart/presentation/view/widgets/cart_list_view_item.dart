import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/shared/widgets/custom_alart_dialog.dart';
import 'package:e_commerce_app/core/shared/widgets/custom_image_error.dart';
import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:e_commerce_app/features/cart/data/models/cart_model/cart_model.dart';
import 'package:e_commerce_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/cart/presentation/manager/cart_cubit/cart_states.dart';
import 'package:e_commerce_app/features/cart/presentation/view/widgets/price_and_amount_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartListViewItem extends StatelessWidget {
  const CartListViewItem({super.key, required this.index, required this.model});
  final int index;
  final CartModel? model;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit,CartStates>(
      builder: (context, state) {
     return Slidable(
    
      startActionPane:  ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              CartCubit.get(context).changeCart(productId: model!.data!.cartsItem![index].product!.id!);
            },
            backgroundColor: Colors.red,
            icon: Icons.delete_rounded,
            label: AppLocalizations.of(context)!.delete,
            foregroundColor: Colors.white,
            flex: 2,
          ),
          SlidableAction(
            onPressed: (context) {
               customAlartDialog(context);
               CartCubit.get(context).changeCart(productId: model!.data!.cartsItem![index].product!.id!);
            },
            icon: Icons.attach_money_rounded,
            backgroundColor: Colors.green,
            label:  AppLocalizations.of(context)!.buy,
            foregroundColor: Colors.white,
            flex: 2,
          ),
        ],
      ),
      child: SizedBox(
        height: 140,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: CachedNetworkImage(
                imageUrl: model?.data?.cartsItem?[index].product?.image ?? "",
                errorWidget: (context, url, error) => const CustomImageError(),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model?.data?.cartsItem?[index].product?.name ?? "Product",
                      style: Styles.textStyleBold14,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                   PriceAndAmountProduct(
                    index: index,
                    model:model ,
                   )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
      },
    );
  }
}
