import 'package:e_commerce_app/features/auth/data/repo/signup_repo/signup_repo.dart';
import 'package:e_commerce_app/features/auth/presentation/manager/signup_cubit/signup_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  final SignUpRepo repo;
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  SignUpCubit(this.repo) : super(SignUpInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);

  Future<void> signUp({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    emit(SignupLoadingcState());
    var data = await repo.signUp(
      name: name,
      phone: phone,
      email: email,
      password: password,
    );

    data.fold((failure) {
      emit(SignUpErrorState(failure.errorMessage));
    }, (model) {
      emit(SignupSuccesscState(model));
    });
  }
}
