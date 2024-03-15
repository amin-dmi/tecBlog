import 'package:tecapplication/component/api_constant.dart';

class PosterModel {
  String? id;
  String? title;
  String? image;

  PosterModel({this.id, this.image, this.title});

  PosterModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    image = ApiConsttant.hostUrl + element["image"];
  }
}
