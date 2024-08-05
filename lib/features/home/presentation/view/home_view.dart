import 'package:e_commerce_app/features/home/presentation/view/widgets/home_view_widgets/home_view_body.dart';
import 'package:e_commerce_app/features/wishlist/presentation/manager/wishlist_cubit/wishlist_cubit.dart';
import 'package:e_commerce_app/features/wishlist/presentation/manager/wishlist_cubit/wishlist_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistCubit, WishlistStates>(
      builder: (context, state) =>  const Scaffold(
        body: HomeViewBody(),
    ),
    );
   
  }
}
