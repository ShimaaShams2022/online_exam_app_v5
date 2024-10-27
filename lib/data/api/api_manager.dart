import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app_v5/data/api/model/response/all_subjects_response.dart';

import 'api_constants.dart';
import 'model/request/register_request.dart';
import 'model/response/data_auth_response.dart';



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


Future<AuthResponseDto?> login(String email, String password) async
 {
 var response = await _dio.post(ApiConstants.signInApi,data:
 {
  "email": email ,
  "password":password

 });
 var authResponse = AuthResponseDto.fromJson(response.data);

return authResponse ;



 }

 Future<AuthResponseDto?> resetPassword(String email, String password) async
 {
  var response = await _dio.put(ApiConstants.resetPasswordApi,data:
  {
   "email": email ,
   "newPassword":password
  });
  var authResponse = AuthResponseDto.fromJson(response.data);

  return authResponse ;



 }

 Future<AuthResponseDto?> forgetPassword(String email) async
 {
  var response = await _dio.post(ApiConstants.forgetPasswordApi,data:
  {
   "email": email ,
  });
  var authResponse = AuthResponseDto.fromJson(response.data);

  return authResponse ;



 }

 Future<AuthResponseDto?> verifyPassword(String otp) async
 {
  var response = await _dio.post(ApiConstants.verifyPasswordApi,data:
  {
   "resetCode": otp ,
  });
  var authResponse = AuthResponseDto.fromJson(response.data);

  return authResponse ;



 }

 Future<AuthResponseDto?>register(RegisterRequest registerRequest) async {

  var response=await _dio.post(ApiConstants.registerApi,data:{
  "username": registerRequest.username,
  "firstName":registerRequest.firstName,
  "lastName" : registerRequest.lastName,
  "email": registerRequest.email,
  "password": registerRequest.password,
  "rePassword" : registerRequest.rePassword,
  "phone" :registerRequest.phone,
  });
  var authResponse=AuthResponseDto.fromJson(response.data);
  return authResponse;
 }

 Future<AllSubjectsResponse?> getAllSubjects(String token) async
 {
  var response = await _dio.get(ApiConstants.allSubjectsApi,
      options: Options(
       headers: {"token": token},
      )
  );
  var allSubjectsResponse = AllSubjectsResponse.fromJson(response.data);

  return allSubjectsResponse ;



 }









}