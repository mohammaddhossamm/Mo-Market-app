import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/shared/manager/amount_cubit/amount_cubit.dart';
import 'package:e_commerce_app/core/shared/manager/amount_cubit/amount_states.dart';
import 'package:e_commerce_app/core/shared/widgets/add_remove_amount_product.dart';
import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:e_commerce_app/features/cart/data/models/cart_model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PriceAndAmountProduct extends StatelessWidget {
  final int index;
  final CartModel? model;
  const PriceAndAmountProduct({
    super.key,
    required this.index,
    this.model,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AmountCubit(),
        child: BlocBuilder<AmountCubit, AmountStates>(
          builder: (context, state) {
            return Column(
              children: [
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.totalPrice,
                      style: Styles.textStyleBold14
                          .copyWith(color: AppColors.primary),
                    ),
                    const Spacer(),
                    Text(
                        '\$ ${(model?.data?.cartsItem?[index].product?.price??0)*(kAmountMap[model!.data!.cartsItem![index].product!.id!]!)}',
                        style: Styles.textStyleBold14),
                  ],
                ),
                AddRemoveAmountProduct(
                  addOnPressed: () {
                    AmountCubit.get(context).addCartAmount(
                      productId: model?.data?.cartsItem?[index].product?.id??0,
                    );
                  },
                  amount: kAmountMap[model!.data!.cartsItem![index].product!.id!]!,
                  removeOnPressed: () {
                    AmountCubit.get(context).removeCartAmount(
                      productId: model?.data?.cartsItem?[index].product?.id??0,
                    );
                  },
                ),
              ],
            );
          },
        ));
  }
}
