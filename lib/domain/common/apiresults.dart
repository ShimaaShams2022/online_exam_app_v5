
import 'package:dio/dio.dart';

sealed class Result<T>{}

class Success<T> extends Result<T>{
  T data;
  Success({ required this.data});
}

class Fail<T> extends Result<T>{
  Exception? exception;
  Fail(this.exception);
}

class NoInternetConnection implements Exception{
  String? statusMsg;
  NoInternetConnection(this.statusMsg);
}
class DioHttpException implements Exception{
  DioException? exception;
  DioHttpException(this.exception);
}

