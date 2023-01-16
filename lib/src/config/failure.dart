import 'dart:io';

import 'package:dio/dio.dart';

class Failure {
  final int errorCode;
  final String message;

  Failure({
    required this.errorCode,
    required this.message,
  });

  static const int socketExceptionCode = 1;
  static const String socketExceptionMsg =
      'Please check your internet connection';

  static const int httpExceptionCode = 2;
  static const String httpExceptionMsg =
      'Oops! An error occurred. Please try again';

  static const int formatExceptionCode = 3;
  static const String formatExceptionMsg =
      'Oops! A cast error occurred. Please try again';

  static const int somethingWentWrongCode = 4;
  static const String somethingWentWrongMsg =
      'Oops! An error occurred. Please try again';

  factory Failure.fromException(Exception err) {
    if (err is DioError) {
      switch (err.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
          return Failure(
            errorCode: Failure.socketExceptionCode,
            message: Failure.socketExceptionMsg,
          );

        case DioErrorType.response:
          return Failure(
            errorCode: err.response!.statusCode!,
            message: err.response!.statusMessage!,
          );

        case DioErrorType.other:
        default:
          if (err is SocketException) {
            return Failure(
              errorCode: Failure.socketExceptionCode,
              message: Failure.socketExceptionMsg,
            );
          } else if (err is FormatException) {
            return Failure(
              errorCode: Failure.formatExceptionCode,
              message: Failure.formatExceptionMsg,
            );
          } else if (err is HttpException) {
            return Failure(
              errorCode: Failure.somethingWentWrongCode,
              message: Failure.somethingWentWrongMsg,
            );
          } else {
            return Failure(
              errorCode: Failure.somethingWentWrongCode,
              message: Failure.somethingWentWrongMsg,
            );
          }
      }
    } else {
      return Failure(
        errorCode: Failure.somethingWentWrongCode,
        message: Failure.somethingWentWrongMsg,
      );
    }
  }
}
