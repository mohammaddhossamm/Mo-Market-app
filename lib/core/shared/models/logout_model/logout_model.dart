class LogoutModel {
  bool? status;
  String? message;
  LogoutModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}