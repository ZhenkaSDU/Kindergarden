import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:the_basics/logic/data/datasources/auth_datasource.dart';

abstract class AuthRepository {
  // Future<List<AuthModel>> getAuthList();
  Future<Response> getLogin(String phone);
  Future<Response> getSms(String sms, String id);
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl(this.authDataSource);

  @override
  Future<Response> getLogin(String phone) async {
    Response response = await authDataSource.getLogin(phone);
    log("${response.data } repo");
    return response.data['res'];
  }

  @override
  Future<Response> getSms(String sms, String id) async {
    Response response = await authDataSource.getSms(sms, id);
    return response.data['res'];
  }
}