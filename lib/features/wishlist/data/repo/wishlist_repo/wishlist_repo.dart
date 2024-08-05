import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/features/wishlist/data/model/add_remove_wishlist_model/add_remove_wishlist_model.dart';
import 'package:e_commerce_app/features/wishlist/data/model/wishlist_model/wishlist_model.dart';

abstract class WishlistRepo{
  Future<Either<Failures, AddRemoveWishListModel>> addRemoveWishlist({
    required int productId,
  });
  Future<Either<Failures, WishlistModel>> getWishlist();
}