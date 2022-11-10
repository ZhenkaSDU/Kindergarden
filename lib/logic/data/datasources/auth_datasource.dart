import 'dart:developer';

import 'package:dio/dio.dart';

abstract class AuthDataSource {
  Future<Response> getLogin(String phone);
  Future<Response> getSms(String sms, String id);
}

class AuthDataSourceImpl implements AuthDataSource {
  Dio dio = Dio();

  @override
  Future<Response> getLogin(String phone) async {
    Response response = await dio
        .post('https://hegati-app.com/Api/service/kindergardn/login', data: {"phone": phone});
        log("${response.data } Data");
    return response;
  }

  @override
  Future<Response> getSms(String sms, String id) async {
    Response response = await dio.post(
        'https://hegati-app.com/Api/service/kindergardn/login',
        data: {"sms_code": sms, "session_id": id});
    return response;
  }
}