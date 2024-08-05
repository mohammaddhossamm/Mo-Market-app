import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_request.dart';
import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/core/shared/settings_services.dart';
import 'package:e_commerce_app/core/utls/assets.dart';
import 'package:e_commerce_app/features/wishlist/data/model/add_remove_wishlist_model/add_remove_wishlist_model.dart';
import 'package:e_commerce_app/features/wishlist/data/model/wishlist_model/wishlist_model.dart';
import 'package:e_commerce_app/features/wishlist/data/repo/wishlist_repo/wishlist_repo.dart';

class WishlistRepoImplementation implements WishlistRepo {
  final ApiRequest apiRequest;
 
  WishlistRepoImplementation(this.apiRequest);

   @override
    Future<Either<Failures, AddRemoveWishListModel>> addRemoveWishlist({
    required int productId,
    
  }) async { 
    try {
      var data = await apiRequest.postData(
        endPoint: 'favorites',
        data: {'product_id': productId},
        token: SettingsService.getToken(key: kToken),
        lang: SettingsService.getLanguage(key: kLanguage),
      );
      AddRemoveWishListModel addRemoveWishListModel =
          AddRemoveWishListModel.fromJson(data.data);
      return Right(addRemoveWishListModel);
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
  Future<Either<Failures, WishlistModel>> getWishlist() async {
    try {
      var data = await apiRequest.getData(
          endPoint: 'favorites',
          lang: SettingsService.getLanguage(key: kLanguage),
          token: SettingsService.getToken(key: kToken),);
      WishlistModel wishlistModel = WishlistModel.fromJson(data.data);
      return Right(wishlistModel);
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
