import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/features/cart/data/models/cart_model/cart_model.dart';
import 'package:e_commerce_app/features/cart/data/models/change_cart_model/change_cart_model.dart';

abstract class CartRepo {
  Future<Either<Failures, ChangeCartModel>> changeCart({
    required int productId,
  });
  Future<Either<Failures, CartModel>> getCartList();
}
