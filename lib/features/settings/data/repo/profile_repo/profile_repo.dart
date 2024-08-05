import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/core/shared/models/user_model/user_model.dart';

abstract class ProfileRepo{
  Future<Either<Failures,UserModel>> getProfile();
  Future<Either<Failures,UserModel>> updataProfileData({
    required String name,
    required String phone,
    required String email,
  });
  Future<Either<Failures,UserModel>> updataProfilePassword({
    required String name,
    required String phone,
    required String email,
    required String password,
  });
}