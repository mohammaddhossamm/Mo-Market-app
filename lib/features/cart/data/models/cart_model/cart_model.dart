import 'package:e_commerce_app/features/cart/data/models/cart_model/cart_data.dart';

class CartModel {
  bool? status;
  String? message;
  CartData? data;

  CartModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = CartData.fromJson(json['data']);
  }
}
