import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_request.dart';
import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/core/shared/settings_services.dart';
import 'package:e_commerce_app/core/utls/assets.dart';
import 'package:e_commerce_app/features/search/data/models/search_model/search_model.dart';
import 'package:e_commerce_app/features/search/data/repo/search_repo.dart';

class SearchRepoImplemetation implements SearchRepo {
  final ApiRequest apiRequest;

  SearchRepoImplemetation(this.apiRequest);
  @override
  Future<Either<Failures, List<SearchModel> >> getSearchData(String text) async {
    try {
      var data = await apiRequest.postData(
        endPoint: 'products/search',
        data: {'text': text},
        lang: SettingsService.getLanguage(key: kLanguage),
        token: SettingsService.getToken(key: kToken),
      );
      List<SearchModel> model = [];
      model.add(SearchModel.fromJson(data.data));
      return Right(model);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(
            ServerFailure(e.toString(), lottie: AssetsData.errorLottie));
      }
    }
  }
}
