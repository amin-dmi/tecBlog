import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecapplication/component/my_component.dart';
import 'package:tecapplication/controller/article_controller.dart';

class ArticleListScreen extends StatelessWidget {
  ArticleController articleController = Get.put(ArticleController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: appBar('مقالات جدید'),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: SizedBox(
            child: Obx(
              () => ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: articleController.articleList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: size.width / 2,
                                child: Text(
                                  articleController.articleList[index].title!,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      articleController
                                          .articleList[index].author!,
                                      style: textTheme.caption),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    articleController.articleList[index].view! +
                                        "بازدید",
                                    style: textTheme.caption,
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: size.width / 3,
                            height: size.height / 6,
                            child: CachedNetworkImage(
                              imageUrl:
                                  articleController.articleList[index].image!,
                              imageBuilder: (context, imageProvider) {
                                return Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(16))),
                                );
                              },
                              placeholder: (context, url) {
                                return const loading();
                              },
                              errorWidget: (context, url, error) {
                                return const Icon(
                                  Icons.image_not_supported_outlined,
                                  size: 50,
                                  color: Colors.grey,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
