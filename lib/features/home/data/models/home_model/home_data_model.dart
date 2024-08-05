import 'package:e_commerce_app/features/home/data/models/home_model/banner_model.dart';
import 'package:e_commerce_app/features/home/data/models/home_model/product_model.dart';

class HomeDataModel{
  List <BannersModel>? banners;
  List <ProductModel>? products;
  HomeDataModel.fromJson(Map<String, dynamic> json){
    banners = [];
    json['banners'].forEach((item){
      banners!.add(BannersModel.fromJson(item));
    });
    products = [];
    json['products'].forEach((item){
      products!.add(ProductModel.fromJson(item));
    });
  }  
  }