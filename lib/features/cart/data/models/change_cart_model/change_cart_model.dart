import 'package:e_commerce_app/features/cart/data/models/change_cart_model/change_cart_data.dart';

class ChangeCartModel{
  bool? status;
  String? message;
  ChangeCartData? data;

  ChangeCartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = ChangeCartData.fromJson(json['data']);
  }
}