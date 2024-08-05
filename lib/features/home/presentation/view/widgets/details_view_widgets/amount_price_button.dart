import 'package:e_commerce_app/core/shared/manager/amount_cubit/amount_cubit.dart';
import 'package:e_commerce_app/core/shared/manager/amount_cubit/amount_states.dart';
import 'package:e_commerce_app/core/shared/widgets/add_remove_amount_product.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AmountPriceButton extends StatelessWidget {
  final num price;
  const AmountPriceButton({
    super.key,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AmountCubit(),
        child:
            BlocBuilder<AmountCubit, AmountStates>(builder: (context, state) {
          var cubit = AmountCubit.get(context);
          return Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      AppLocalizations.of(context)!.totalPrice,
                    style: Styles.textStyleNormal14.copyWith(
                      color: AppColors.grayColor,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '\$ ${price * cubit.amount}',
                    style: Styles.textStyleBold14,
                  ),
                ],
              ),
              const Spacer(),
              AddRemoveAmountProduct(
                amount: cubit.amount,
                addOnPressed: () {
                  cubit.addAmount();
                },
                removeOnPressed: () {
                  cubit.removeAmount();
                },
              ),
            ],
          );
        }));
  }
}
