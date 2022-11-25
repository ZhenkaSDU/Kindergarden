import 'package:dio/dio.dart';

abstract class SaveChildRemoteDataSource{
  Future<Response> getCheck();
}

class SaveChildRemoteDataSourceImpl extends SaveChildRemoteDataSource{
  Dio dio = Dio();
  @override
  Future<Response> getCheck() async {

    Response response = await dio.get("https://hegati-app.com/Api/service/kindergardn/save_child");
    print(response.data);
    return response;
  }

}