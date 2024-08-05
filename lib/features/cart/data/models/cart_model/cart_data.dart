import 'package:e_commerce_app/features/cart/data/models/cart_model/cart_item.dart';

class CartData{
  List<CartItem>? cartsItem;

  CartData.fromJson(Map<String, dynamic> json){
    if(json['cart_items'] != null){
      cartsItem = [];
      json['cart_items'].forEach((value) {
        cartsItem!.add(CartItem.fromJson(value));
      });
    }
  }
}