import 'package:e_commerce_app/core/shared/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/cart/presentation/view/widgets/cart_list_view.dart';
import 'package:e_commerce_app/features/layout/presentation/manager/layout_cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomAppBar(
              onPressed: () {
                LayoutCubit.get(context).changeNavBarIndex(0);
              },
              text: AppLocalizations.of(context)!.myCart,
            ),
            const SizedBox(
              height: 20,
            ),
            const Expanded(
              child: CartListView(),
            ),
          ],
        ),
      ),
    );
  }
}
