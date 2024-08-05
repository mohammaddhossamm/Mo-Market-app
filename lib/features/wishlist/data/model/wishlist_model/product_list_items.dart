class ProductsItems{
  int? id;
  String? name;
  String? description;
  num? price;
  num? oldPrice;
  num? discount;
  String? image;

ProductsItems.fromJson(Map<String, dynamic> json) { 
  id = json['id'];
  name = json['name'];
  description = json['description'];
  price = json['price']; 
  oldPrice = json['old_price'];
  discount = json['discount'];
  image = json['image'];     
} 
}