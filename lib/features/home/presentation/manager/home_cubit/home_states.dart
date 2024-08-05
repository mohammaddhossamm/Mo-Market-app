abstract class HomeStates {}
class HomeInitialState extends HomeStates {}
class HomeSuccessState extends HomeStates {
  
}
class HomeErrorState extends HomeStates {
  final String error;
  final String lattieError;
  HomeErrorState({required this.error, required this.lattieError});
}
class HomeLoadingState extends HomeStates {}

