import 'package:e_commerce_app/core/shared/widgets/custom_app_bar.dart';
import 'package:e_commerce_app/features/layout/presentation/manager/layout_cubit/layout_cubit.dart';
import 'package:e_commerce_app/features/wishlist/presentation/view/widgets/custom_wishlist_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WishlistViewBody extends StatelessWidget {
  const WishlistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CustomAppBar(
                text: AppLocalizations.of(context)!.myWishlist,
                onPressed: () { 
                  LayoutCubit.get(context).changeNavBarIndex(0);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomWishListGridView()
            ],
          ),
        ),
      ),
    );
  }
}
