import 'package:e_commerce_app/features/wishlist/data/model/wishlist_model/data_model.dart';

class WishlistModel {
  bool? stutas;
  String? message;
  DataWishlist? data;

  WishlistModel.fromJson(Map<String, dynamic>? json) {
    stutas = json?['status'];
    message = json?['message'];
    data = json?['data'] != null ? DataWishlist.fromJson(json?['data']) : null;
  }
} 


 


