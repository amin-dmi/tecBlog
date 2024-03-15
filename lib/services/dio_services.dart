import 'package:dio/dio.dart';

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

  Future<dynamic> postMethode(String url, Map<String, dynamic> map) async {
    dio.options.headers['content-type'] = 'applecation/json';
    return await dio
        .post(url,
            data: map,
            options: Options(responseType: ResponseType.json, method: 'Post'))
        .then((element) {
      return element;
    });
  }
}
