import 'package:e_commerce_app/features/cart/data/models/cart_model/cart_product.dart';

class CartItem {
  int? id;
  int? quantity;
  CartProduct? product;
  CartItem.fromJson(Map<String, dynamic> json){
    id = json['id'];
    quantity = json['quantity'];
    product = CartProduct.fromJson(json['product']);
  }
}