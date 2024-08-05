import 'package:e_commerce_app/features/search/data/models/search_model/search_data.dart';

class SearchModel {
  bool? status;
  String? message;
  SearchData? data;

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? SearchData.fromJson(json['data']) : null;
  }
}