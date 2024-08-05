import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_request.dart';
import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/core/shared/settings_services.dart';
import 'package:e_commerce_app/core/utls/assets.dart';
import 'package:e_commerce_app/features/home/data/home_repo/home_repo.dart';
import 'package:e_commerce_app/features/home/data/models/home_model/home_model.dart';

class HomeRepoImplementation implements HomeRepo {
   final ApiRequest apiRequest;
  HomeRepoImplementation(this.apiRequest);
  @override
  Future<Either<Failures, HomeModel>> getHomeData() async{
    try{
      var data = await apiRequest.getData(
        endPoint: 'home',
        token: SettingsService.getToken(key: kToken),
        lang: SettingsService.getLanguage(key: kLanguage),
      );
      HomeModel homeData = HomeModel.fromJson(data.data);
      return Right(homeData);
    }catch(error){
      if(error is DioException){
        return left(ServerFailure.fromDioError(error));
      }else{
        return left(
          ServerFailure(error.toString(),lottie: AssetsData.errorLottie),);
      }
    }
  }
}