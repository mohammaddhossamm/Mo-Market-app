class Data{
  String? name;
  String? email;
  String? token; 
  String? phone;
  
  Data.fromJson(Map<String, dynamic> json){
    name = json['name'];
    email = json['email'];
    token = json['token'];
    phone=json['phone'];
  }
}