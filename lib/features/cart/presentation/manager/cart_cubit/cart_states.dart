abstract class CartStates{}

class CartInitialState extends CartStates{}
class CartLoadingState extends CartStates{}
class CartSuccessState extends CartStates{}
class CartErrorState extends CartStates{
  final String error;
  final String lottie;
  CartErrorState({required this.error,required this.lottie});
}
class ChangeInCartState extends CartStates{}

class ChangeInCartSuccessState extends CartStates{}
class ChangeInCartErrorState extends CartStates{
  final String error;
  final String lottie;
  ChangeInCartErrorState({required this.error,required this.lottie});
}
