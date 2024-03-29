import 'package:get/get.dart';
import 'package:tecapplication/component/api_constant.dart';
import 'package:tecapplication/models/article_model.dart';
import 'package:tecapplication/services/dio_services.dart';

class ArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getList();
  }

  getList() async {
    loading.value = true;

    //TODO: Get UserId From Storage + UserId
    var response = await DioServices().getMethode(ApiConsttant.getArticleList);

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });

      loading.value = false;
    }
  }
}
