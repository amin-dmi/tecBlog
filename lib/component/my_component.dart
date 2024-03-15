import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
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
