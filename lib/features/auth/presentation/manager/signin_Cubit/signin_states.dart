
import 'package:e_commerce_app/core/shared/models/user_model/user_model.dart';

abstract class SignInStates {}
class SignInInitial extends SignInStates {}
class SignInLoadingState extends SignInStates {}
class SignInSuccessState extends SignInStates {
  final UserModel signInModel;
  SignInSuccessState(this.signInModel);
}
class SignInErrorState extends SignInStates {
  final String error;
  SignInErrorState(this.error);
}

