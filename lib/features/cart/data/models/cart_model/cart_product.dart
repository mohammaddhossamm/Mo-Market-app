class CartProduct{
  int? id;
  num? price;
  num? oldPrice;
  num? discount;
  String? image;
  List? imagesList;
  String? name;
  String? description;
  bool? inFavorites;
  bool? inCart;

  CartProduct.fromJson(Map<String, dynamic> json){
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    imagesList = json['images'];
    name = json['name'];
    description = json['description'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}