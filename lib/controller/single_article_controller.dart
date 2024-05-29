import 'package:get/get.dart';
import 'package:tecapplication/component/api_constant.dart';
import 'package:tecapplication/models/article_info_model.dart';
import 'package:tecapplication/models/article_model.dart';
import 'package:tecapplication/models/tags_model.dart';
import 'package:tecapplication/services/dio_services.dart';
import 'package:tecapplication/view/articles/single.dart';

class SingleArticleController extends GetxController {
  RxBool loading = false.obs;
  RxInt id = RxInt(0);
  Rx<ArticleInfoModel> articelInfoModel = ArticleInfoModel().obs;

  RxList<TagsModel> tags = RxList();
  RxList<ArticleModel> relatedList = RxList();

  @override
  onInit() {
    super.onInit();
  }

  getList(var id) async {
    loading.value = true;
    //UserId is Hard code
    var UserId = "";

    //https://techblog.sasansafari.com/Techblog/api/article/get.php?command=info&id=16&user_id=
    var response = await DioServices().getMethode(ApiConsttant.baseUrl +
        'article/get.php?command=info&id=${id}}&user_id=${UserId}');

    if (response.statusCode == 200) {
      articelInfoModel.value = ArticleInfoModel.formjson(response.data);
      loading.value = false;
    }

    tags.clear();
    response.data['tags'].forEach((element) {
      tags.add(TagsModel.fromJson(element));
    });

    relatedList.clear();
    response.data['related'].forEach((element) {
      relatedList.add(ArticleModel.fromJson(element));
    });

    Get.to(Single());
  }
}
