import 'package:tecapplication/myColors.dart';
import 'package:flutter/material.dart';
import 'package:tecapplication/myStrings.dart';

import '../my_component.dart';

class profileScreen extends StatelessWidget {
  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  profileScreen({
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/avatar.png',
              height: 100,
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  myString.imageProfile,
                  style: textTheme.headline3,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Icon(
                  Icons.edit,
                  color: solidColors.seeMore,
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              'فاطمه امیری',
              style: textTheme.headline4,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'amin.dmi1375@gmail.com',
              style: textTheme.headline4,
            ),
            myDivider(size: size),
            InkWell(
              splashColor: solidColors.primeryColor,
              onTap: () {},
              child: SizedBox(
                  height: 45,
                  child: Center(
                      child: Text(
                    myString.myFavBlog,
                    style: textTheme.headline4,
                  ))),
            ),
            myDivider(size: size),
            InkWell(
              splashColor: solidColors.primeryColor,
              onTap: () {},
              child: SizedBox(
                  height: 45,
                  child: Center(
                      child: Text(
                    myString.myFavPodcast,
                    style: textTheme.headline4,
                  ))),
            ),
            myDivider(size: size),
            InkWell(
              splashColor: solidColors.primeryColor,
              onTap: () {},
              child: SizedBox(
                  height: 45,
                  child: Center(
                      child: Text(
                    myString.logOut,
                    style: textTheme.headline4,
                  ))),
            ),
          ],
        ),
      ),
    );
  }
}
