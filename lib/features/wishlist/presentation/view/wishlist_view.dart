import 'package:e_commerce_app/features/wishlist/presentation/view/widgets/wishlist_view_body.dart';
import 'package:flutter/material.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WishlistViewBody(),
    );
  }
}