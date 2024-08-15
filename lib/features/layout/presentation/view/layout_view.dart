import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/utls/service_locator.dart';
import 'package:e_commerce_app/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/features/home/data/home_repo/home_repo_implementation.dart';
import 'package:e_commerce_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:e_commerce_app/features/layout/presentation/manager/layout_cubit/layout_cubit.dart';
import 'package:e_commerce_app/features/layout/presentation/manager/layout_cubit/layout_states.dart';
import 'package:e_commerce_app/features/layout/presentation/view/widgets/custom_nav_bar.dart';
import 'package:e_commerce_app/features/wishlist/presentation/manager/wishlist_cubit/wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LayoutCubit(),
        ),
        BlocProvider(
          create: (context) =>
              HomeCubit(getIt.get<HomeRepoImplementation>())..getHomeData(),
        ),
      ],
      child: BlocBuilder<LayoutCubit, LayoutStates>(
        builder: (context, state) {
          var layoutCubit = LayoutCubit.get(context);
          if (layoutCubit.navBarCurrentIndex == 0) {
            if (kHomeModel == null) {
              HomeCubit.get(context).getHomeData();
            }
          }
          if (layoutCubit.navBarCurrentIndex == 2) {
            if (kWishListModel == null) {
              WishlistCubit.get(context).getWishlist();
            }
          }
          if (layoutCubit.navBarCurrentIndex == 1) {
            if (kCartModel == null) {
              CartCubit.get(context).getCartList();
            }
          }
          return Scaffold(
              body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              screens[layoutCubit.navBarCurrentIndex],
              const CustomNavBar(),
            ],
          ));
        },
      ),
    );
  }
}
