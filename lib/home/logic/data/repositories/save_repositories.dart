import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:the_basics/home/logic/data/datasources/save_datasources.dart';

abstract class SaveRepository {
  Future<String> saveChildRes(String sessionId, String id, String firstName,
      String lastName, String parents);
}

class SaveRepositoryImpl implements SaveRepository {
  final SaveDataSource saveDataSource;

  SaveRepositoryImpl(this.saveDataSource);

  @override
  Future<String> saveChildRes(String sessionId, String id, String firstName,
      String lastName, String parents) async {
    Response response = await saveDataSource.saveChildRes(
        sessionId, id, firstName, lastName, parents);
    log("$response + repository");
    return response.data['res'];
  }
}
