import 'package:e_commerce_app/features/auth/data/repo/singin_repo/singin_repo.dart';
import 'package:e_commerce_app/features/auth/presentation/manager/signin_Cubit/signin_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInStates> {
  final SignInRepo userRepo;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  SignInCubit(this.userRepo) : super(SignInInitial());

  static SignInCubit get(context) => BlocProvider.of(context);

  Future<void> signIn({
    required String email, 
    required String password,
    required BuildContext context,
  }) async {
    emit(SignInLoadingState());
    var data = await userRepo.signIn(email: email, password: password);
    data.fold((failure) {
      emit(SignInErrorState(failure.errorMessage));
    }, (data) {
      emit(
        SignInSuccessState(data), 
      ); 
    });
  }

  
}
