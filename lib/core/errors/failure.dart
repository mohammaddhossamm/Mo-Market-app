import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/utls/assets.dart';

abstract class Failures {
  final String errorMessage;
  final String lottie;
   Failures(this.errorMessage,{required this.lottie});
}

class ServerFailure extends Failures {
  ServerFailure(super.errorMessage, {required super.lottie});
  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with server',lottie: AssetsData.timeoutLottie);
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with server',lottie: AssetsData.timeoutLottie);
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with server',lottie: AssetsData.timeoutLottie);
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate with server',lottie: AssetsData.errorLottie);
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Your request was canceled',lottie: AssetsData.errorLottie);
      case DioExceptionType.connectionError:
        return ServerFailure('Check your internet connection',lottie: AssetsData.internetLottie);
      case DioExceptionType.unknown:
        return ServerFailure('Unexpected Error, please try later',lottie: AssetsData.errorLottie);
      default:
        return ServerFailure(
            'Oops! There was an error, please try again later',lottie: AssetsData.errorLottie);
    }
  }

  factory ServerFailure.fromBadResponse(
      int? statusCode, Map<String, dynamic> errorResponse) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure('Oops! There was an error, please try again later',lottie: AssetsData.errorLottie);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, please try later',lottie: AssetsData.error404Lottie);
    } else if (statusCode == 500) {
      return ServerFailure('Server Error, please try again',lottie: AssetsData.errorLottie);
    } else {
      return ServerFailure('Oops! There was an error, please try again later',lottie: AssetsData.errorLottie);
    }
  }
}
