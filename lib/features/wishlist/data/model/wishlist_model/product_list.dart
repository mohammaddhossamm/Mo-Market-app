import 'package:e_commerce_app/features/wishlist/data/model/wishlist_model/product_list_items.dart';

class ProductsList{
  ProductsItems? products;

  ProductsList.fromJson(Map<String, dynamic> json) {  
    products = ProductsItems.fromJson(json['product']);
  }
}     