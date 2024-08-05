class AddRemoveWishListModel {
  bool? status;
  String? message;
  AddRemoveWishListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}