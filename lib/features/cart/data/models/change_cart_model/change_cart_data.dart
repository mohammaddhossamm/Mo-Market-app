import 'package:e_commerce_app/features/cart/data/models/change_cart_model/change_cart_product.dart';

class ChangeCartData {
  int? id;
  int? quantity;
  ChangeCartProduct? product;

  ChangeCartData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    product = ChangeCartProduct.fromJson(json['product']);
  }
}
