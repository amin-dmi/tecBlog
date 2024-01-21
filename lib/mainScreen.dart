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
    double bodyMargin = size.width / 12;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          children: [
            //AppBar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.menu),
                Image.asset('assets/images/logo.png',
                    height: size.height / 13.6),
                Icon(Icons.search),
              ],
            ),

            //Poster
            Stack(
              children: [
                Container(
                  width: size.width / 1.25,
                  height: size.height / 4.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
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
                              Icon(
                                Icons.remove_red_eye_sharp,
                                color: Colors.white,
                                size: 16,
                              ),
                              SizedBox(
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
            const SizedBox(
              height: 16,
            ),
            //TagList
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tagList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, 8, index == 0 ? bodyMargin : 15, 8),
                    child: Container(
                      height: 60.0,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        color: Colors.cyan,
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
                            Icon(
                              Icons.tag,
                              color: Colors.white,
                              size: 24,
                            ),
                            SizedBox(
                              width: 5.0,
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
                  SizedBox( height:32),
                  Text("مشاهده داغ ترین نوشته ها",style: textThem.headline3,),
                  SizedBox( width:13),
                  Icon(Icons.edit, color: solidColors.seeMore),

                ],
              ),
            ),



            //Post
            Padding(
              padding:  EdgeInsets.only(right: bodyMargin),
              child: SizedBox(
                height: size.height/4.1,
                child: ListView.builder(
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 60,
                      width: 100,
                      color: Colors.yellow,
                    ),
                  );
                },),
              ),
            )




          ],
        ),
      )),
    );
  }
}
