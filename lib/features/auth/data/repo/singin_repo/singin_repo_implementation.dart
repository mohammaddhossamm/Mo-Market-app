import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_request.dart';
import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/core/shared/settings_services.dart';
import 'package:e_commerce_app/core/utls/assets.dart';
import 'package:e_commerce_app/core/shared/models/user_model/user_model.dart';
import 'package:e_commerce_app/features/auth/data/repo/singin_repo/singin_repo.dart';

class SignInRepoImplementation implements SignInRepo {
  final ApiRequest apiRequest;
  SignInRepoImplementation(this.apiRequest);
  @override
  Future<Either<Failures, UserModel>> signIn({
    required String email,
    required String password,
  }) async {
      try{
      var data = await apiRequest.postData(
        endPoint: 'login',
        lang: SettingsService.getLanguage(key: kLanguage),
        data: {
          "email": email,
          "password": password,
        },
      );
      UserModel userData = UserModel.fromJson(data.data);
      return Right(userData);
      }catch(e){
        if(e is DioException){
          return left(ServerFailure.fromDioError(e));
        }else{
          return left( ServerFailure(e.toString(),lottie:AssetsData.errorLottie),);
        }
      }
    }
  }

