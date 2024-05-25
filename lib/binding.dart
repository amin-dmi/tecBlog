import 'package:get/get.dart';
import 'package:tecapplication/controller/list_article_controller.dart';
import 'package:tecapplication/controller/register_Controller.dart';
import 'package:tecapplication/controller/single_article_controller.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ListArticleController());
    Get.lazyPut(() => SingleArticleController());
  }
}

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}
