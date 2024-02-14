import 'package:get/get.dart';
import 'package:tecapplication/component/api_constant.dart';
import 'package:tecapplication/models/article_model.dart';
import 'package:tecapplication/models/podcast_model.dart';
import 'package:tecapplication/models/poster_model.dart';
import 'package:tecapplication/services/dio_services.dart';

class HomeScreenController extends GetxController {
  late Rx<PosterModel> poster;
  RxList tagList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> topPodcast = RxList();

  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    var response = await DioServices().getMethode(ApiConsttant.getHomeItems);

    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVisitedList.add(ArticleModel.fromJson(element));
      });
    }
  }
}
