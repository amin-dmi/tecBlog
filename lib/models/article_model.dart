import 'package:tecapplication/component/api_constant.dart';

class ArticleModel {
  String? id;
  String? title;
  String? image;
  String? catid;
  String? catname;
  String? author;
  String? view;
  String? status;
  String? createdat;

  ArticleModel({
    required this.id,
    required this.title,
    required this.image,
    required this.catid,
    required this.catname,
    required this.author,
    required this.view,
    required this.status,
    required this.createdat,
  });

  ArticleModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    image = ApiConsttant.hostUrl + element["image"];
    catid = element["cat_id"];
    catname = element["cat_name"];
    author = element["author"];
    view = element["view"];
    status = element["status"];
    createdat = element["created_at"];
  }
}
