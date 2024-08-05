abstract class ProfileStates {}

class ProfileInitState extends ProfileStates {}

class GetProfileLoadingState extends ProfileStates {}

class GetProfileSuccessState extends ProfileStates {}

class GetProfileErrorState extends ProfileStates {
  final String error;
  final String lottie;
  GetProfileErrorState({
    required this.error,
    required this.lottie,
  });
}

class UpdataProfileSuccessState extends ProfileStates {
  final bool state;
  final String message;

  UpdataProfileSuccessState(this.message, this.state);
}
class UpdataProfileErrorState extends ProfileStates {
  final String error;
  final String lottie;
  UpdataProfileErrorState({
    required this.error,
    required this.lottie,
  });
}