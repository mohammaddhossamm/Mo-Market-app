import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/api/api_request.dart';
import 'package:e_commerce_app/features/cart/data/repo/cart_repo_implementation.dart';
import 'package:e_commerce_app/features/home/data/home_repo/home_repo_implementation.dart';
import 'package:e_commerce_app/features/auth/data/repo/signup_repo/signup_repo_implementation.dart';
import 'package:e_commerce_app/features/auth/data/repo/singin_repo/singin_repo_implementation.dart';
import 'package:e_commerce_app/features/search/data/repo/search_repo_implemetation.dart';
import 'package:e_commerce_app/features/settings/data/repo/logout_repo/logout_repo_implemetation.dart';
import 'package:e_commerce_app/features/settings/data/repo/profile_repo/profile_repo_implementation.dart';
import 'package:e_commerce_app/features/wishlist/data/repo/wishlist_repo/wishlist_repo_implementation.dart';
import 'package:get_it/get_it.dart';

final getIt=GetIt.instance;

void setupServiceLocator(){

  // 2 Base 
  getIt.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    ),
  );  
  getIt.registerSingleton<ApiRequest>(
    ApiRequest(
        getIt.get<Dio>(),
      ),
  );
  
  // Branches
  getIt.registerSingleton<SignInRepoImplementation>(
    SignInRepoImplementation(
      getIt.get<ApiRequest>(),
    ),
  );

  getIt.registerSingleton<HomeRepoImplementation>(
    HomeRepoImplementation(
      getIt.get<ApiRequest>(),
    )
  );

  getIt.registerSingleton<WishlistRepoImplementation>(
    WishlistRepoImplementation(
      getIt.get<ApiRequest>(),
    )
  );
   getIt.registerSingleton<CartRepoImplementation>(
    CartRepoImplementation(
      getIt.get<ApiRequest>(),
    )
  );
   getIt.registerSingleton<SignUpRepoImplementation>(
    SignUpRepoImplementation(
      getIt.get<ApiRequest>(),
    )
  );
  getIt.registerSingleton<ProfileRepoImplementation>(
    ProfileRepoImplementation(
      getIt.get<ApiRequest>(),
    )
  );
  getIt.registerSingleton<LogoutRepoImplemetation>(
    LogoutRepoImplemetation(
      getIt.get<ApiRequest>(),
    )
  );
  getIt.registerSingleton<SearchRepoImplemetation>(
    SearchRepoImplemetation(
      getIt.get<ApiRequest>(),
    )
  );
}
