import 'package:e_commerce_app/core/shared/models/user_model/user_model.dart';

abstract class SignUpStates {}
class SignUpInitial extends SignUpStates {}
class SignupSuccesscState extends SignUpStates{
  final UserModel model;
  SignupSuccesscState(this.model);
}
class SignupLoadingcState extends SignUpStates{}
class SignUpErrorState extends SignUpStates {
  final String error;
  SignUpErrorState(this.error);
}