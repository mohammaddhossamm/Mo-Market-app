import 'package:e_commerce_app/core/constants.dart';
import 'package:e_commerce_app/features/wishlist/data/repo/wishlist_repo/wishlist_repo.dart';
import 'package:e_commerce_app/features/wishlist/presentation/manager/wishlist_cubit/wishlist_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<WishlistStates> {
  final WishlistRepo wishlistRepo;
  WishlistCubit(this.wishlistRepo) : super(WishlistInitialState());
  
 
  static WishlistCubit get(context) => BlocProvider.of(context);

Future<void> getWishlist()async{
  emit(WishlistLoadingState());
  var data = await wishlistRepo.getWishlist();
  data.fold((failure) {
    emit(WishlistErrorState(failure.errorMessage,failure.lottie));
  }, (model) {
    kWishListModel=model; 
    emit(WishlistSuccessState());  
  });
}

  void changeWishListIcon({required int productId}) async{
    kWishListMap[productId]=!kWishListMap[productId]!;
    emit(AddToWishListChangIconState());
    var data = await wishlistRepo.addRemoveWishlist( 
      productId: productId,
      );
    data.fold((failure){
      kWishListMap[productId]=!kWishListMap[productId]!;
      emit(AddToWishListErrorState(failure.errorMessage,failure.lottie));
    }, (model){
      if(model.status==false){
       kWishListMap[productId]=!kWishListMap[productId]!;
      }else{
        getWishlist();
      }
      emit(AddToWishListSuccessState());
    }); 
  }

} 