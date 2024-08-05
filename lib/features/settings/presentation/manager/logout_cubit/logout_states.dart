 abstract class LogoutStates {}

class LogoutInItState extends LogoutStates {}

class LogoutLoadingState extends LogoutStates {}

class LogoutSuccessState extends LogoutStates {
   final bool status;
   final String message;

  LogoutSuccessState({ required this.message, required this.status}) ;
  
  
}

class LogoutErrorState extends LogoutStates {
  final String error;
  final String lottie;
  LogoutErrorState({
    required this.error,
    required this.lottie,
  });
}
