import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/shared/widgets/custom_button.dart';
import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:e_commerce_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/cart/presentation/manager/cart_cubit/cart_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomChangeCartButton extends StatelessWidget {
  final int productId;
  const CustomChangeCartButton({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(builder: (context, state) {
      return CustomButton(
        textButton: kCartMap[productId] ?? false
            ? AppLocalizations.of(context)!.removeCart
            : AppLocalizations.of(context)!.addCart,
        onPressed: () async {
          await CartCubit.get(context).changeCart(productId: productId);
        },
        buttonColor: kCartMap[productId] ?? false
            ? AppColors.primary
            : AppColors.grayColor,
      );
    });
  }
}
