import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:e_commerce_app/features/home/data/models/home_model/home_model.dart';

abstract class HomeRepo {
  Future<Either<Failures, HomeModel>> getHomeData();
}
