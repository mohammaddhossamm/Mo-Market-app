import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_request.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/core/utls/assets.dart';
import 'package:e_commerce_app/core/shared/models/user_model/user_model.dart';
import 'package:e_commerce_app/features/auth/data/repo/signup_repo/signup_repo.dart';

class SignUpRepoImplementation implements SignUpRepo {
  final ApiRequest apiRequest;

  SignUpRepoImplementation(this.apiRequest);
  @override
  Future<Either<Failures, UserModel>> signUp({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    try {
      var data = await apiRequest.postData(
        endPoint: 'register',
        lang: 'en',
        data: {
          "name": name,
          "phone": phone,
          "email":email ,
          "password":password ,
          "image": ""
        },
      );
      UserModel model = UserModel.fromJson(data.data);
      return Right(model);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString(),lottie: AssetsData.errorLottie));
      }
    }
  }
}
