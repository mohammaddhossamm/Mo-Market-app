import 'package:e_commerce_app/core/utls/colors.dart';
import 'package:e_commerce_app/features/layout/presentation/manager/layout_cubit/layout_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../manager/layout_cubit/layout_cubit.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
   

    return BlocBuilder<LayoutCubit,LayoutStates>(
      builder: (context, state) {
         var layoutCubit = LayoutCubit.get(context);
        return  Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.balckColor,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(0.1),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 5,
          ),
          child: GNav(
            activeColor: AppColors.primary,
            color: AppColors.grayColor,
            tabBackgroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 12,
            ),
            duration: const Duration(milliseconds: 400),
            gap: 3,
            tabs: const [
              GButton(
                icon: Icons.home_rounded,
              ),
              GButton(
                icon: Icons.shopping_cart_rounded,
              ),
              GButton(
                icon: Icons.favorite_rounded,
              ),
              GButton(
                icon: Icons.settings_rounded,
              ),
            ],
            onTabChange: (value) {
              layoutCubit.changeNavBarIndex(value);
            },
            selectedIndex: layoutCubit.navBarCurrentIndex,
          ),
        ),
      ),
    );
      },
    );
  }
}
