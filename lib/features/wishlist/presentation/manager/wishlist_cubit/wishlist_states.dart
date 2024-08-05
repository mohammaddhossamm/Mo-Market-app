abstract class WishlistStates {}

class WishlistInitialState extends WishlistStates {}

class WishlistLoadingState extends WishlistStates {}

class WishlistSuccessState extends WishlistStates {}

class WishlistErrorState extends WishlistStates {
  final String error;
  final String lottie;
  WishlistErrorState(this.error, this.lottie); 
}
class AddToWishListChangIconState extends WishlistStates{}
class AddToWishListSuccessState extends WishlistStates{}
class AddToWishListErrorState extends WishlistStates{
  final String error;
   final String lottie;
  AddToWishListErrorState(this.error, this.lottie); 
}
