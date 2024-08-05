import 'package:e_commerce_app/features/search/data/models/search_model/search_data_items.dart';

class SearchData{
  List<SearchDataItems>? data;
  SearchData(this.data);
  SearchData.fromJson(Map<String, dynamic> json)
  {
    data=[];
    json['data'].forEach((value) {
      data?.add(SearchDataItems.fromJson(value));
    });
  }
}
