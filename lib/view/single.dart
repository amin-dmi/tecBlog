import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tecapplication/component/myColors.dart';
import 'package:tecapplication/component/my_component.dart';
import 'package:tecapplication/controller/list_article_controller.dart';
import 'package:tecapplication/controller/single_article_controller.dart';
import 'package:tecapplication/view/articel_list_screen.dart';

class Single extends StatelessWidget {
  // SingleArticleController singelArticelController =
  //     Get.put(SingleArticleController());

  var singelArticelController = Get.find<SingleArticleController>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = size.width / 20;

    return SafeArea(
        child: Scaffold(
      body: Obx(
        () => singelArticelController.articelInfoModel.value.title == null
            ? SizedBox(
                height: size.height,
                child: loading(),
              )
            : Column(
                children: [
                  Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: singelArticelController
                            .articelInfoModel.value.image!,
                        imageBuilder: (context, imageProvider) {
                          return Image(image: imageProvider);
                        },
                        placeholder: (context, url) {
                          return const loading();
                        },
                        errorWidget: (context, url, error) {
                          return Image.asset(
                              'assets/images/single_place_holder.jpg');
                        },
                      ),
                      Positioned(
                          top: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Icon(
                                  Icons.share,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.bookmark,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                Expanded(child: SizedBox()),
                                Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ],
                            ),
                            height: 60,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    end: Alignment.bottomCenter,
                                    begin: Alignment.topCenter,
                                    colors:
                                        gradiantColors.singelAppBarGradiant)),
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      singelArticelController.articelInfoModel.value.title!,
                      maxLines: 2,
                      style: textTheme.titleLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/avatar.png',
                          height: 50,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          singelArticelController
                              .articelInfoModel.value.author!,
                          style: textTheme.headline4,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          singelArticelController
                              .articelInfoModel.value.createdAt!,
                          style: textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: HtmlWidget(
                      singelArticelController.articelInfoModel.value.content!,
                      textStyle: textTheme.headlineSmall,
                      enableCaching: true,
                      onLoadingBuilder: (context, element, loadingProgress) =>
                          const loading(),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(
                              0, 8, index == 0 ? bodyMargin : 20, 8),
                          child: mainTags(index: index, textTheme: textTheme),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    ));
  }

  Widget tags(texttheme) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              var tagId = singelArticelController.tags[index].id;
              await Get.find<ListArticleController>()
                  .getArticelListWithTagId(tagId!);

              Get.to(ArticleListScreen());
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                height: 30,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    color: Colors.grey),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Text(singelArticelController.tags[index].title!),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
