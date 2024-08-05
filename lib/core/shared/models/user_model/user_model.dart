import 'package:e_commerce_app/core/shared/models/user_model/user_data_model.dart';

class UserModel{
  bool? status;
  String? message;
  Data? data;

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}