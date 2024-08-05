import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_request.dart';
import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/core/shared/settings_services.dart';
import 'package:e_commerce_app/core/utls/assets.dart';
import 'package:e_commerce_app/features/cart/data/models/cart_model/cart_model.dart';
import 'package:e_commerce_app/features/cart/data/models/change_cart_model/change_cart_model.dart';
import 'package:e_commerce_app/features/cart/data/repo/cart_repo.dart';

class CartRepoImplementation implements CartRepo {
  ApiRequest apiRequest;
  CartRepoImplementation(this.apiRequest);
  @override
  Future<Either<Failures, ChangeCartModel>> changeCart({
    required int productId,
  }) async {
    try {
      var data = await apiRequest.postData(
        endPoint: 'carts',
        lang:SettingsService.getLanguage(key: kLanguage),
        token: SettingsService.getToken(key: kToken),
        data: {
          'product_id': productId,
        },
      );
      ChangeCartModel changeCartModel = ChangeCartModel.fromJson(data.data);
      return Right(changeCartModel);
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
  Future<Either<Failures, CartModel>> getCartList()async {
    try {
      var data = await apiRequest.getData(
        endPoint: 'carts',
        lang: SettingsService.getLanguage(key: kLanguage),
        token: SettingsService.getToken(key: kToken),
      );

      CartModel cartModel = CartModel.fromJson(data.data);
      return Right(cartModel);
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
