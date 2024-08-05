import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/core/shared/models/user_model/user_model.dart';

abstract class SignInRepo {
 Future<Either<Failures, UserModel>> signIn({
    required String email,
    required String password,
  });
// Future<Either<Failures,Response>> signUp(String name, String email, String password);
}