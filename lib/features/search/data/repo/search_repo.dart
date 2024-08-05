import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/features/search/data/models/search_model/search_model.dart';

abstract class SearchRepo {
  Future<Either<Failures, List<SearchModel> >> getSearchData(String text);
}