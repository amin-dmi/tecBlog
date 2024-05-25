import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_service;

class DioServices {
  Dio dio = Dio();

  Future<dynamic> getMethode(String url) async {
    dio.options.headers['content-type'] = 'applecation/json';
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'Get'))
        .then((response) {
      return response;
    });
  }

  Future<dynamic> postMethode(
    Map<String, dynamic> map,
    String url,
  ) async {
    dio.options.headers['content-type'] = 'multipart/form-data';
    //TODO: Rread Token from Storeage.
    return await dio
        .post(url,
            data: dio_service.FormData.fromMap(map),
            options: Options(responseType: ResponseType.json, method: 'POST'))
        .then((element) {
      return element;
    });
  }
}
