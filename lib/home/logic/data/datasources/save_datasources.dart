import 'dart:developer';

import 'package:dio/dio.dart';

abstract class SaveDataSource {
  Future<Response> saveChildRes(String sessionId, String id, String firstName,
      String lastName, String parents);
}

class SaveDataSourceImpl implements SaveDataSource {
  Dio dio = Dio();

  @override
  Future<Response> saveChildRes(String sessionId, String id, String firstName,
      String lastName, String parents) async {
    Response response = await dio.post(
        'https://hegati-app.com/Api/service/kindergardn/save_child',
        data: {
          "sessionId": sessionId,
          "id": id,
          "firstName": firstName,
          "lastName": lastName,
          "parents": parents
        });
    log("$response + datasource");
    print("$response + datasource");
    return response;
  }
}
