import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/core/shared/models/user_model/user_model.dart';

abstract class SignUpRepo {
  Future<Either<Failures,UserModel>> signUp({
    required String name,
    required String phone,
    required String email,
    required String password,
  });
}