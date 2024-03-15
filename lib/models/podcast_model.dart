import 'package:tecapplication/component/api_constant.dart';

class PodcastModel {
  String? id;
  String? title;
  String? poster;
  String? catname;
  String? author;
  String? view;
  String? status;
  String? createdat;

  PodcastModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.catname,
    required this.author,
    required this.view,
    required this.status,
    required this.createdat,
  });

  PodcastModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    poster = ApiConsttant.hostUrl + element["poster"];
    catname = element["cat_name"];
    author = element["author"];
    view = element["view"];
    status = element["status"];
    createdat = element["created_at"];
  }
}
