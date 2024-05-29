import 'package:get/get.dart';
import 'package:tecapplication/component/api_constant.dart';
import 'package:tecapplication/models/article_model.dart';
import 'package:tecapplication/services/dio_services.dart';

class ListArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
  }

  getArticelListWithTagId(String id) async {
    loading.value = true;
    articleList.clear();
    //TODO: Get UserId From Storage + UserId
    var response = await DioServices().getMethode(ApiConsttant.baseUrl +
        "article/get.php?command=get_articles_with_tag_id&tag_id=${id}&user_id=");

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });

      loading.value = false;
    }
  }
}
