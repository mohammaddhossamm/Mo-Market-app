import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:e_commerce_app/features/wishlist/presentation/manager/wishlist_cubit/wishlist_cubit.dart';
import 'package:e_commerce_app/features/wishlist/presentation/manager/wishlist_cubit/wishlist_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFavIcon extends StatelessWidget {
  final int productId;
  const CustomFavIcon({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistStates>(
      builder: (context, state) {
        var iconCubit = WishlistCubit.get(context);
        return CircleAvatar(
          radius: 18,
          backgroundColor: AppColors.lightWhite,
          child: IconButton(
            onPressed: () {
              iconCubit.changeWishListIcon(productId: productId);
            },
            icon: Icon(
              kWishListMap[productId]! 
                  ? Icons.favorite_rounded
                  : Icons.favorite_outline_rounded,
              size: 18,
            ),
          ),
        );
      },
    );
  }
}
