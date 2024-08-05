import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:e_commerce_app/core/utls/styles.dart';
import 'package:e_commerce_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:e_commerce_app/features/wishlist/presentation/manager/wishlist_cubit/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomErrorWidget extends StatelessWidget {
  final String lottie;
  final String errorMessage;
  const CustomErrorWidget(
      {super.key, required this.lottie, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Lottie.asset(
                  lottie,
                  fit: BoxFit.contain,
                  repeat: true,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              errorMessage,
              style: Styles.textStyleNormal14,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.lightWhite,
              child: IconButton(
                onPressed: () async {
                  await HomeCubit.get(context).getHomeData().then(
                    (value) {
                      WishlistCubit.get(context).getWishlist().then(
                            (value) => CartCubit.get(context).getCartList(),
                          );
                    },
                  );
                },
                icon: const Icon(
                  Icons.refresh_rounded,
                  color: AppColors.primary,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
