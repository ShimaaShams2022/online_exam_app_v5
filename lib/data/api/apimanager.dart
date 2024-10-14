import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'apiconstants.dart';
import 'model/request/registerrequest.dart';
import 'model/response/authhresponse.dart';


@singleton
class ApiManager {

 late Dio _dio ;
ApiManager(){_dio= Dio(BaseOptions(baseUrl:ApiConstants.baseUrl));

_dio.interceptors.add(LogInterceptor(
 responseHeader: true,
 requestHeader: true,
 responseBody: true,
 requestBody: true,
 logPrint: (object) {
  debugPrint("Api -> $object");
 },
));
}


Future<AuthResponse?> login(String email, String password) async
 {
 var response = await _dio.post(ApiConstants.signInApi,data:
 {
  "email": email ,
  "password":password

 });
 var authResponse = AuthResponse.fromJson(response.data);

return authResponse ;



 }

 Future<AuthResponse?>register(RegisterRequest registerRequest) async {

  var response=await _dio.post(ApiConstants.registerApi,data:{
  "username": registerRequest.username,
  "firstName":registerRequest.firstName,
  "lastName" : registerRequest.lastName,
  "email": registerRequest.email,
  "password": registerRequest.password,
  "rePassword" : registerRequest.rePassword,
  "phone" :registerRequest.phone,
  });
  var authResponse=AuthResponse.fromJson(response.data);
  return authResponse;
 }









}