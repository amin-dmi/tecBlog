import 'package:get/get.dart';
import 'package:tecapplication/controller/article/list_article_controller.dart';
import 'package:tecapplication/controller/article/manage_article_controller.dart';
import 'package:tecapplication/controller/register_Controller.dart';
import 'package:tecapplication/controller/article/single_article_controller.dart';

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

class ArticelManagerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ManageArticleController());
  }
}
