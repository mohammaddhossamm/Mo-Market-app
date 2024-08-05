import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_request.dart';
import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/core/shared/models/logout_model/logout_model.dart';
import 'package:e_commerce_app/core/shared/settings_services.dart';
import 'package:e_commerce_app/core/utls/assets.dart';
import 'package:e_commerce_app/features/settings/data/repo/logout_repo/logout_repo.dart';

class LogoutRepoImplemetation implements LogoutRepo {
  final ApiRequest apiRequest;

  LogoutRepoImplemetation(this.apiRequest);
  @override
  Future<Either<Failures, LogoutModel>> logout() async {
    try {
      var data = await apiRequest.postData(
        endPoint: 'logout',
        lang: SettingsService.getLanguage(key: kLanguage),
        token: SettingsService.getToken(key: kToken),
        data: {},
      );
      LogoutModel model = LogoutModel.fromJson(data.data);
      return Right(model);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString(), lottie: AssetsData.errorLottie));
      }
    }
  }
}