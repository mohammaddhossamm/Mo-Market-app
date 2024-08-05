class SearchDataItems{
  int? id;
  String? name;
  String? description; 
  String? image;
  List? imagesList;
  num? price;


  SearchDataItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    imagesList = json['images'];
    price = json['price'];
  }
}