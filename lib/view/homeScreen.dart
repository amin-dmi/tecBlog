import 'package:get/get.dart';
import 'package:tecapplication/component/myColors.dart';
import 'package:flutter/material.dart';
import 'package:tecapplication/controller/home_screen_controller.dart';
import 'package:tecapplication/models/fake_data.dart';

import '../component/my_component.dart';

class homeScreen extends StatelessWidget {
  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  homeScreen({
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          homePagePoster(),
          const SizedBox(height: 16),
          homePageTagList(),
          homePageSeeMoreBlog(),
          topVisited(),
          homePagePodcast(),
          topVisited(),
          const SizedBox(height: 50)
        ],
      ),
    );
  }

  Padding homePagePodcast() {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 32),
          Text(
            "مشاهده داغ ترین پادکست ها",
            style: textTheme.headline3,
          ),
          const SizedBox(width: 13),
          const Icon(Icons.edit, color: solidColors.seeMore),
        ],
      ),
    );
  }

  Padding topVisited() {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin),
      child: SizedBox(
        height: size.height / 4.1,
        child: Obx(
          () => ListView.builder(
            itemCount: homeScreenController.topVisitedList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              //blogItems
              return Padding(
                padding: EdgeInsets.only(
                    right: index == 0 ? bodyMargin : 15, bottom: 14),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height / 5.3,
                      width: size.width / 2.4,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16),
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(homeScreenController
                                      .topVisitedList[index].image!),
                                  fit: BoxFit.cover),
                            ),
                            foregroundDecoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: gradiantColors.postGradiant),
                            ),
                          ),
                          Positioned(
                            bottom: 8.0,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.remove_red_eye_sharp,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                        homeScreenController
                                            .topVisitedList[index].view!,
                                        style: textTheme.subtitle1),
                                  ],
                                ),
                                Text(
                                  homeScreenController
                                      .topVisitedList[index].author!,
                                  style: textTheme.subtitle1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        homeScreenController.topVisitedList[index].title!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      height: size.height / 30,
                      width: size.width / 2.4,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Padding homePageSeeMoreBlog() {
    return Padding(
      padding: EdgeInsets.only(right: bodyMargin, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 32),
          Text(
            "مشاهده داغ ترین نوشته ها",
            style: textTheme.headline3,
          ),
          const SizedBox(width: 13),
          const Icon(Icons.edit, color: solidColors.seeMore),
        ],
      ),
    );
  }

  SizedBox homePageTagList() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tagList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 20, 8),
            child: mainTags(key: key, index: index, textTheme: textTheme),
          );
        },
      ),
    );
  }

  Stack homePagePoster() {
    return Stack(
      children: [
        Container(
          width: size.width / 1.25,
          height: size.height / 4.2,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            image: DecorationImage(
              image: Image.asset(homePagePosterMap["imageAssets"]).image,
              fit: BoxFit.cover,
            ),
          ),
          foregroundDecoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            gradient: LinearGradient(
                colors: gradiantColors.homePosterCoverGradiant,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.remove_red_eye_sharp,
                        color: Colors.white,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(homePagePosterMap["view"],
                          style: textTheme.subtitle1),
                    ],
                  ),
                  Text(
                    homePagePosterMap["writer"] +
                        " - " +
                        homePagePosterMap["date"],
                    style: textTheme.subtitle1,
                  ),
                ],
              ),
              Text(homePagePosterMap["title"], style: textTheme.headline1),
            ],
          ),
        ),
      ],
    );
  }
}
