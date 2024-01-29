import 'package:flutter/material.dart';
import 'package:tecapplication/models/fake_data.dart';
import 'package:tecapplication/myColors.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  @override
  Widget build(BuildContext context) {
    var textThem = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 20;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: solidColors.scafoldBg,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(Icons.menu),
            Image.asset('assets/images/logo.png',
                height: size.height / 13.6,),
            const Icon(Icons.search),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: Column(
            children: [


              //Poster
              Stack(
                children: [
                  Container(
                    width: size.width / 1.25,
                    height: size.height / 4.2,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      image: DecorationImage(
                        image:
                            Image.asset(homePagePosterMap["imageAssets"]).image,
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
                                    style: textThem.subtitle1),
                              ],
                            ),
                            Text(
                              homePagePosterMap["writer"] +
                                  " - " +
                                  homePagePosterMap["date"],
                              style: textThem.subtitle1,
                            ),
                          ],
                        ),
                        Text(homePagePosterMap["title"],
                            style: textThem.headline1),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              //TagList
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tagList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 8, index == 0 ? bodyMargin : 20, 8),
                      child: Container(
                        height: 60.0,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          gradient: LinearGradient(
                              colors: gradiantColors.tags,
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                          child: Row(
                            children: [
                              Text(
                                tagList[index].title,
                                style: textThem.headline2,
                              ),
                              const Icon(
                                Icons.tag,
                                color: Colors.white,
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              //SeeMore
              Padding(
                padding: EdgeInsets.only(right: bodyMargin, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(height: 32),
                    Text(
                      "مشاهده داغ ترین نوشته ها",
                      style: textThem.headline3,
                    ),
                    const SizedBox(width: 13),
                    const Icon(Icons.edit, color: solidColors.seeMore),
                  ],
                ),
              ),

              //blogList
              Padding(
                padding: EdgeInsets.only(right: bodyMargin),
                child: SizedBox(
                  height: size.height / 4.1,
                  child: ListView.builder(
                    itemCount: 7,
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
                                          image: Image.asset(
                                                  'assets/images/per1.jpg')
                                              .image,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
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
                                                style: textThem.subtitle1),
                                          ],
                                        ),
                                        Text(
                                          homePagePosterMap["writer"],
                                          style: textThem.subtitle1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              child: Text(
                                'texttexfdshvgjkfcahdhsabcdasjkbcdskvcjhdbashvc dbh vhdfjbvcjhbvhjdgbsahcjdbasncv dsb,Cdjkbscvhjdbhcjdmn   chdjkslhvjdsgvjdgsbchjvdgbcvnzBCvnxzbnvbsfgdklashfghahttexttexttexttexttexttexttexttexttexttexttexttext',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              width: size.width / 2.4,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),

              //Podcasts
              Padding(
                padding: EdgeInsets.only(right: bodyMargin, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(height: 32),
                    Text(
                      "مشاهده داغ ترین پادکست ها",
                      style: textThem.headline3,
                    ),
                    const SizedBox(width: 13),
                    const Icon(Icons.edit, color: solidColors.seeMore),
                  ],
                ),
              ),

              //blogList
              Padding(
                padding: EdgeInsets.only(right: bodyMargin),
                child: SizedBox(
                  height: size.height / 4.1,
                  child: ListView.builder(
                    itemCount: 7,
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
                                          image: Image.asset(
                                                  'assets/images/per1.jpg')
                                              .image,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
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
                                                style: textThem.subtitle1),
                                          ],
                                        ),
                                        Text(
                                          homePagePosterMap["writer"],
                                          style: textThem.subtitle1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              child: Text(
                                'texttexfdshvgjkfcahdhsabcdasjkbcdskvcjhdbashvc dbh vhdfjbvcjhbvhjdgbsahcjdbasncv dsb,Cdjkbscvhjdbhcjdmn   chdjkslhvjdsgvjdgsbchjvdgbcvnzBCvnxzbnvbsfgdklashfghahttexttexttexttexttexttexttexttexttexttexttexttext',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              width: size.width / 2.4,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        )),
      ),

      bottomNavigationBar: Container(

      ),

    );
  }
}
