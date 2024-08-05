class ChangeCartProduct{
  int? id;
  num? price;
  String? image;
  ChangeCartProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    image = json['image'];
  }
}