import 'package:e_commerce_app/features/search/data/models/search_model/search_model.dart';

abstract class SearchStates {}

class SearchInitial extends SearchStates {}

class SearchLoading extends SearchStates {}

class SearchSuccess extends SearchStates {
  final List<SearchModel> searchList;
  SearchSuccess(this.searchList);
}

class SearchError extends SearchStates {
  final String error;
  final String lottie;
  SearchError({required this.error, required this.lottie});
}