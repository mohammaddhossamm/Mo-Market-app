class BannersModel{
    int? id;
    String? image;
    BannersModel.fromJson(Map<String, dynamic> json){
      id = json['id'];
      image = json['image'];
    }
  }