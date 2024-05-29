import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tecapplication/component/text_style.dart';
import 'package:tecapplication/controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:tecapplication/component/myColors.dart';
import 'package:url_launcher/url_launcher.dart';

class myDivider extends StatelessWidget {
  Size? size;
  myDivider({required this.size});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: solidColors.dividerColor,
      indent: size!.width / 6,
      thickness: 1.0,
      endIndent: size!.width / 6,
    );
  }
}

class mainTags extends StatelessWidget {
  mainTags({
    super.key,
    required this.textTheme,
    required this.index,
  });

  final TextTheme textTheme;
  var index;
  @override
  Widget build(BuildContext context) {
    return Container(
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
              Get.find<HomeScreenController>().tagList[index].title!,
              style: textTheme.headline2,
            ),
            const Icon(
              Icons.tag,
              color: Colors.white,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}

myLunchUrl(String myUrl) async {
  var uri = Uri.parse(myUrl);

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  }
}

class loading extends StatelessWidget {
  const loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCube(
      color: solidColors.primeryColor,
      size: 32.0,
    );
  }
}

PreferredSize appBar(String titleText) {
  return PreferredSize(
    preferredSize: Size.fromHeight(60.0),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              child: Icon(Icons.keyboard_arrow_right),
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                  color: solidColors.primeryColor.withAlpha(100),
                  shape: BoxShape.circle),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                titleText,
                style: appBarTextStyle,
              ),
            ),
          ),
        ],
        elevation: 0,
      ),
    ),
  );
}
