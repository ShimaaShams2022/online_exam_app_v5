


import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../domain/common/apiresults.dart';

Future<Result<T>> executeApi<T>(Future<T> Function() apiCall )async{

  try {
    var result= await apiCall.call();
    return Success(data: result);
  } on TimeoutException catch (ex) {
    return Fail(NoInternetConnection(ex.message));
  } on DioException catch (ex) {
    return Fail(DioHttpException(ex));
  } on IOException catch (ex) {
    return Fail(NoInternetConnection(ex.toString()));
  }on Exception catch(ex){
    return Fail(ex);
  }
}