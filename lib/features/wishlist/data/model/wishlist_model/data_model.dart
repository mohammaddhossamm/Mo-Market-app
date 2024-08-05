import 'package:e_commerce_app/features/wishlist/data/model/wishlist_model/product_list.dart';

class DataWishlist {
  int? currentPage ;
  List<ProductsList>? data; 

  DataWishlist.fromJson(Map<String, dynamic>? json) {
    currentPage= json?['current_page'];
    if (json?['data'] != null) {
      data =[];
      json?['data'].forEach((value) {
        data!.add(ProductsList.fromJson(value)); 
      });
    }
  }
}