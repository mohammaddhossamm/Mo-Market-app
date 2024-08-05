import 'package:e_commerce_app/core/shared/models/user_model/user_model.dart';
import 'package:e_commerce_app/features/settings/data/repo/profile_repo/profile_repo.dart';
import 'package:e_commerce_app/features/settings/presentation/manager/profile_cubit/profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  final ProfileRepo repo;
  late UserModel profileModel;
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  ProfileCubit(this.repo) : super(ProfileInitState());
  static ProfileCubit get(context) => BlocProvider.of(context);

  Future<void> getProfile() async {
    emit(GetProfileLoadingState());
    var data = await repo.getProfile();
    data.fold(
      (failure) {
        emit(GetProfileErrorState(
            error: failure.errorMessage, lottie: failure.lottie));
      },
      (model) {
        profileModel = model;
        emit(GetProfileSuccessState());
      },
    );
  }

  Future<void> updataProfileData({
    required String name,
    required String phone,
    required String email,
  }) async {
    var data = await repo.updataProfileData(
      name: name,
      phone: phone,
      email: email,
    );
    data.fold(
      (failure) {
        emit(UpdataProfileErrorState(
            error: failure.errorMessage, lottie: failure.lottie));
      },
      (model) {
        emit(UpdataProfileSuccessState(model.message!, model.status!));
        getProfile();
      },
    );
  }

  Future<void> updataProfilePassword({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    var data = await repo.updataProfilePassword(
      name: name,
      phone: phone,
      email: email,
      password: password,
    );
    data.fold(
      (failure) {
        emit(UpdataProfileErrorState(
            error: failure.errorMessage, lottie: failure.lottie));
      },
      (model) {
        emit(UpdataProfileSuccessState(model.message!, model.status!));
        getProfile();
      },
    );
  }
}
