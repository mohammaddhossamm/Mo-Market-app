import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/core/shared/models/logout_model/logout_model.dart';

abstract class LogoutRepo {
  Future<Either<Failures, LogoutModel>> logout();
}