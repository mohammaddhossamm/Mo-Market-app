import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_request.dart';
import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/core/shared/models/user_model/user_model.dart';
import 'package:e_commerce_app/core/shared/settings_services.dart';
import 'package:e_commerce_app/core/utls/assets.dart';
import 'package:e_commerce_app/features/settings/data/repo/profile_repo/profile_repo.dart';

class ProfileRepoImplementation implements ProfileRepo {
  final ApiRequest apiRequest;

  ProfileRepoImplementation(this.apiRequest);
  @override
  Future<Either<Failures, UserModel>> getProfile() async {
    try {
      var data = await apiRequest.getData(
        endPoint: 'profile',
        lang: SettingsService.getLanguage(key: kLanguage),
        token: SettingsService.getToken(key: kToken),
      );
      UserModel model = UserModel.fromJson(data.data);
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

  @override
  Future<Either<Failures, UserModel>> updataProfileData({
    required String name,
    required String phone,
    required String email,
  }) async {
    try {
      var data = await apiRequest.putData(
        endPoint: 'update-profile',
        lang: SettingsService.getLanguage(key: kLanguage),
        token: SettingsService.getToken(key: kToken),
        data: {
          "name": name,
          "phone": phone,
          "email": email
        },
      );
      UserModel model = UserModel.fromJson(data.data);
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

  @override
  Future<Either<Failures, UserModel>> updataProfilePassword({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    try {
       var data = await apiRequest.putData(
        endPoint: 'update-profile',
        lang: SettingsService.getLanguage(key: kLanguage),
        token: SettingsService.getToken(key: kToken),
        data: {
          "name": name,
          "phone": phone,
          "email": email,
          "password": password
        },
      );
      UserModel model = UserModel.fromJson(data.data);
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
