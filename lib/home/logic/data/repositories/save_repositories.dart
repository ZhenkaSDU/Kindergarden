
import 'package:dio/dio.dart';
import '../datasources/save_datasources.dart';

import '../models/saveChild_models.dart';

abstract class SaveChildRepository{
  Future<String> getCheck();
}

class SaveChildRepositoryImpl extends SaveChildRepository{
  final SaveChildRemoteDataSource saveChildRemoteDataSource;

  SaveChildRepositoryImpl(this.saveChildRemoteDataSource);

  @override
  Future<String> getCheck() async {
    Response data = await saveChildRemoteDataSource.getCheck();
    return data.data["res"];
  }
}